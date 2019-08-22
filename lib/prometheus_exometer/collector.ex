defmodule PrometheusExometer.Collector do
  use Prometheus.Collector

  alias PrometheusExometer.FormatText

  @labels [:processes, :atom, :binary, :code, :ets]

  @impl
  def collect_mf(_registry, callback) do
    memory = :erlang.memory()

    callback.(
      create_gauge(
        :erlang_vm_bytes_total,
        "The total amount of memory currently allocated.",
        memory
      )
    )

    :ok
  end

  @impl
  def collect_metrics(:erlang_vm_bytes_total, memory) do
    Prometheus.Model.gauge_metrics(
      for label <- @labels do
        {[type: label], memory[label]}
      end
    )
  end

  defp create_gauge(name, help, data) do
    Prometheus.Model.create_mf(name, help, :gauge, __MODULE__, data)
  end

  @doc """
  Format data from Exometer metrics in Prometheus text format.

  It takes a map with configuration options.

  config = %{namespace: list(atom), converters: list(module)}

  Keys:

  - `namespace`: a prefix which will be added to each metric, normally the app name
  - `converters`: a list of modules which have callback functions to convert
      internal Exometer names into external format

  """
  @spec scrape() :: iolist
  def scrape() do
    start_time = :os.timestamp()

    results =

    {time, results} = :timer.tc(fn ->
      [:_]
      |> :exometer.find_entries()
      |> Enum.sort()
      |> List.foldl(%{}, &collect_children/2)
    end)

    [
      results,
      Prometheus.Model.gauge_metric([name: :exometer_scrape_duration_microseconds], time)
    ]
  end

  defp collect_children({exometer_name, exometer_type, :enabled}, parents) do
    info = :exometer.info(exometer_name)
    options = info[:options]
    prometheus_options = options[:prometheus] || %{}

    case Map.fetch(prometheus_options, :parent) do
      :error ->
        # Parent or simple metric
        # Lager.debug("parent #{inspect exometer_name} info #{inspect info}")
        Map.put(parents, exometer_name, %{info: info, children: []})

      {:ok, parent_name} ->
        # Child, may also be a parent if it's a composite type
        # Lager.debug("child #{inspect exometer_name} info #{inspect info}")
        if exometer_type in [:prometheus_counter, :prometheus_gauge, :prometheus_histogram] do
          # parents = Map.put(parents, exometer_name, %{info: info, children: []})
          update_in(parents[parent_name][:children], &(&1 ++ [info]))
        else
          if Map.has_key?(prometheus_options, :internal) do
            parents
          else
            update_in(parents[parent_name][:children], &(&1 ++ [info]))
          end
        end
    end
  end

  defp collect_children({_, _, _}, acc) do
    # Skip disabled entries
    acc
  end

  @doc "Filter list of modules to ones with a `prometheus_convert_name` callback"
  @spec get_converters(list(module)) :: list(module)
  def get_converters([]), do: []

  def get_converters(modules) do
    Enum.filter(modules, &exports_prometheus_convert_name?/1)
  end

  @doc "Return true if module exports an `prometheus_convert_name` callback function"
  @spec exports_prometheus_convert_name?(module) :: boolean
  def exports_prometheus_convert_name?(module) do
    exports = module.module_info(:exports)
    Keyword.has_key?(exports, :prometheus_convert_name)
  end
end
