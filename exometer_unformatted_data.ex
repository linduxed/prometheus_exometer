# Data obtained by running a modified PrometheusExometer.scrape/0:
#
# PrometheusExometer.scrape/0 obtains some data, then formats like Prometheus
# would format it if it ran its own formatters.
#
# This file contains what one gets when dumping all the data, without
# formatting it.

%{
  #
  # One entry like this for every VNode, i.e. many.
  #
  [
    :riak,
    :riak_core,
    :vnodeq,
    ExMeerkat.VNode,
    148_433_760_041_419_827_630_061_740_822_747_494_183_805_648_896
  ] => %{
    # Always the same
    children: [],
    info: [
      # Always the same as the top-level key
      name: [
        :riak,
        :riak_core,
        :vnodeq,
        ExMeerkat.VNode,
        148_433_760_041_419_827_630_061_740_822_747_494_183_805_648_896
      ],
      # Always the same
      type: :function,
      # Always the same
      behaviour: :undefined,
      # Always the same
      module: :exometer_function,
      # Always the same
      status: :enabled,
      # Always the same
      cache: 0,
      # Increases when work increases
      value: [value: 0],
      # Always the same
      timestamp: :undefined,
      options: [
        arg:
          {:erlang, :process_info, ["#PID<0.2229.0>", :message_queue_len], :match, {:_, :value}}
      ],
      ref:
        {:erlang, :process_info, :once, ["#PID<0.2229.0>", :message_queue_len], :match,
         {:_, :value}}
    ]
  },

  #
  # Every other metric captured by exometer.
  #
  [:duration] => %{
    children: [],
    info: [
      name: [:duration],
      type: :prometheus_histogram,
      behaviour: :undefined,
      module: :prometheus_exometer_histogram,
      status: :enabled,
      cache: 0,
      value: [
        sum: 0,
        count: 0,
        "100": 0,
        "250": 0,
        "500": 0,
        "750": 0,
        "1000": 0,
        "5000": 0,
        "10000": 0,
        "25000": 0,
        "50000": 0,
        "75000": 0,
        "100000": 0,
        "500000": 0,
        "750000": 0,
        "1000000": 0,
        "1500000": 0,
        "2000000": 0,
        "2100000": 0,
        "2500000": 0,
        "+Inf": 0
      ],
      timestamp: :undefined,
      options: [
        time_span: 300_000,
        truncate: false,
        histogram_module: :exometer_slide,
        keep_high: 100,
        prometheus: %{
          buckets: [
            100,
            250,
            500,
            750,
            1000,
            5000,
            10000,
            25000,
            50000,
            75000,
            100_000,
            500_000,
            750_000,
            1_000_000,
            1_500_000,
            2_000_000,
            2_100_000,
            2_500_000
          ],
          description: "Time to create response",
          export_buckets: true,
          suffix: :us,
          unit: :us
        }
      ],
      ref: "#PID<0.1795.0>"
    ]
  },
  [:requests] => %{
    children: [],
    info: [
      name: [:requests],
      type: :prometheus_counter,
      behaviour: :undefined,
      module: :prometheus_exometer_counter,
      status: :enabled,
      cache: 0,
      value: [value: 0, ms_since_reset: 427_185],
      timestamp: :undefined,
      options: [
        module: :prometheus_exometer_counter,
        prometheus: %{description: "Total number of requests"}
      ],
      ref: "#PID<0.1797.0>"
    ]
  },
  [:responses] => %{
    children: [],
    info: [
      name: [:responses],
      type: :prometheus_counter,
      behaviour: :undefined,
      module: :prometheus_exometer_counter,
      status: :enabled,
      cache: 0,
      value: [value: 0, ms_since_reset: 427_184],
      timestamp: :undefined,
      options: [
        module: :prometheus_exometer_counter,
        prometheus: %{description: "Total number of responses"}
      ],
      ref: "#PID<0.1798.0>"
    ]
  },
  [:riak, :common, :cpu_stats] => %{
    children: [],
    info: [
      name: [:riak, :common, :cpu_stats],
      type: :cpu,
      behaviour: :undefined,
      module: :exometer_cpu,
      status: :enabled,
      cache: 0,
      value: [nprocs: 952, avg1: 865, avg5: 957, avg15: 730],
      timestamp: :undefined,
      options: [sample_interval: 5000],
      ref: "#PID<0.1940.0>"
    ]
  },
  [:riak, :common, :mem_stats] => %{
    children: [],
    info: [
      name: [:riak, :common, :mem_stats],
      type: :function,
      behaviour: :undefined,
      module: :exometer_function,
      status: :enabled,
      cache: 0,
      value: [total: 8_242_548_736, allocated: 5_957_332_992],
      timestamp: :undefined,
      options: [
        arg: {:memsup, :get_memory_data, [], :match, {:total, :allocated, :_}}
      ],
      ref: {:memsup, :get_memory_data, :once, [], :match, {:total, :allocated, :_}}
    ]
  },
  [:riak, :common, :memory_stats] => %{
    children: [],
    info: [
      name: [:riak, :common, :memory_stats],
      type: :function,
      behaviour: :undefined,
      module: :exometer_function,
      status: :enabled,
      cache: 0,
      value: [
        total: 78_668_368,
        processes: 32_485_336,
        processes_used: 32_484_128,
        system: 46_183_032,
        atom: 1_509_537,
        atom_used: 1_487_832,
        binary: 458_208,
        code: 27_789_137,
        ets: 3_483_200
      ],
      timestamp: :undefined,
      options: [
        arg:
          {:erlang, :memory, [], :proplist,
           [:total, :processes, :processes_used, :system, :atom, :atom_used, :binary, :code, :ets]}
      ],
      ref:
        {:erlang, :memory, :once, [], :proplist,
         [:total, :processes, :processes_used, :system, :atom, :atom_used, :binary, :code, :ets]}
    ]
  },
  [:riak, :riak_core, :converge_delay] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :converge_delay],
      type: :duration,
      behaviour: :undefined,
      module: :exometer_duration,
      status: :enabled,
      cache: 0,
      value: [
        {:count, 0},
        {:last, 0},
        {:n, 0},
        {:mean, 0},
        {:min, 0},
        {:max, 0},
        {:median, 0},
        {50, 0},
        {75, 0},
        {90, 0},
        {95, 0},
        {99, 0},
        {999, 0}
      ],
      timestamp: :undefined,
      options: [],
      ref: "#PID<0.1944.0>"
    ]
  },
  [:riak, :riak_core, :dropped_vnode_requests] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :dropped_vnode_requests],
      type: :counter,
      behaviour: :undefined,
      module: :exometer,
      status: :enabled,
      cache: 0,
      value: [value: 0, ms_since_reset: 426_676],
      timestamp: 308_475_480_560,
      options: [],
      ref: :undefined
    ]
  },
  [:riak, :riak_core, :gossip_received] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :gossip_received],
      type: :spiral,
      behaviour: :undefined,
      module: :exometer_spiral,
      status: :enabled,
      cache: 0,
      value: [count: 0, one: 0],
      timestamp: :undefined,
      options: [],
      ref: "#PID<0.1943.0>"
    ]
  },
  [:riak, :riak_core, :handoff_timeouts] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :handoff_timeouts],
      type: :counter,
      behaviour: :undefined,
      module: :exometer,
      status: :enabled,
      cache: 0,
      value: [value: 0, ms_since_reset: 426_677],
      timestamp: 308_475_480_559,
      options: [],
      ref: :undefined
    ]
  },
  [:riak, :riak_core, :ignored_gossip_total] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :ignored_gossip_total],
      type: :counter,
      behaviour: :undefined,
      module: :exometer,
      status: :enabled,
      cache: 0,
      value: [value: 0, ms_since_reset: 426_681],
      timestamp: 308_475_480_555,
      options: [],
      ref: :undefined
    ]
  },
  [:riak, :riak_core, :rebalance_delay] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :rebalance_delay],
      type: :duration,
      behaviour: :undefined,
      module: :exometer_duration,
      status: :enabled,
      cache: 0,
      value: [
        {:count, 0},
        {:last, 0},
        {:n, 0},
        {:mean, 0},
        {:min, 0},
        {:max, 0},
        {:median, 0},
        {50, 0},
        {75, 0},
        {90, 0},
        {95, 0},
        {99, 0},
        {999, 0}
      ],
      timestamp: :undefined,
      options: [],
      ref: "#PID<0.1945.0>"
    ]
  },
  [:riak, :riak_core, :rejected_handoffs] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :rejected_handoffs],
      type: :counter,
      behaviour: :undefined,
      module: :exometer,
      status: :enabled,
      cache: 0,
      value: [value: 0, ms_since_reset: 426_677],
      timestamp: 308_475_480_559,
      options: [],
      ref: :undefined
    ]
  },
  [:riak, :riak_core, :ring_creation_size] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :ring_creation_size],
      type: :function,
      behaviour: :undefined,
      module: :exometer_function,
      status: :enabled,
      cache: 0,
      value: [value: 128],
      timestamp: :undefined,
      options: [
        arg: {:app_helper, :get_env, [:riak_core, :ring_creation_size], :match, :value}
      ],
      ref: {:app_helper, :get_env, :once, [:riak_core, :ring_creation_size], :match, :value}
    ]
  },
  [:riak, :riak_core, :rings_reconciled] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :rings_reconciled],
      type: :spiral,
      behaviour: :undefined,
      module: :exometer_spiral,
      status: :enabled,
      cache: 0,
      value: [count: 0, one: 0],
      timestamp: :undefined,
      options: [],
      ref: "#PID<0.1942.0>"
    ]
  },
  [:riak, :riak_core, :vnodeq, ExMeerkat.VNode] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :vnodeq, ExMeerkat.VNode],
      type: :function,
      behaviour: :undefined,
      module: :exometer_function,
      status: :enabled,
      cache: 0,
      value: [mean: 0.0, total: 0, min: 0, median: 0, max: 0],
      timestamp: :undefined,
      options: [
        arg:
          {:riak_core_stat, :vnodeq_stats, [ExMeerkat.VNode], :histogram,
           [:mean, :median, :min, :max, :total]},
        aliases: [
          mean: ExMeerkat.VNodeq_mean,
          median: ExMeerkat.VNodeq_median,
          min: ExMeerkat.VNodeq_min,
          max: ExMeerkat.VNodeq_max,
          total: ExMeerkat.VNodeq_total
        ],
        arg:
          {:riak_core_stat, :vnodeq_stats, [ExMeerkat.VNode], :histogram,
           [:mean, :median, :min, :max, :total]},
        aliases: [
          mean: ExMeerkat.VNodeq_mean,
          median: ExMeerkat.VNodeq_median,
          min: ExMeerkat.VNodeq_min,
          max: ExMeerkat.VNodeq_max,
          total: ExMeerkat.VNodeq_total
        ]
      ],
      ref:
        {:riak_core_stat, :vnodeq_stats, :once, [ExMeerkat.VNode], :histogram,
         [:mean, :median, :min, :max, :total]}
    ]
  },
  [:riak, :riak_core, :vnodes_running, ExMeerkat.VNode] => %{
    children: [],
    info: [
      name: [:riak, :riak_core, :vnodes_running, ExMeerkat.VNode],
      type: :function,
      behaviour: :undefined,
      module: :exometer_function,
      status: :enabled,
      cache: 0,
      value: [value: 128],
      timestamp: :undefined,
      options: [
        arg:
          {:exometer, :select_count,
           [
             [
               {{[:riak, :riak_core, :vnodeq, ExMeerkat.VNode, :_], :_, :_}, [], [true]}
             ]
           ], :match, :value},
        aliases: [value: ExMeerkat.VNodes_running],
        arg:
          {:exometer, :select_count,
           [
             [
               {{[:riak, :riak_core, :vnodeq, ExMeerkat.VNode, :_], :_, :_}, [], [true]}
             ]
           ], :match, :value},
        aliases: [value: ExMeerkat.VNodes_running]
      ],
      ref:
        {:exometer, :select_count, :once,
         [
           [
             {{[:riak, :riak_core, :vnodeq, ExMeerkat.VNode, :_], :_, :_}, [], [true]}
           ]
         ], :match, :value}
    ]
  }
}
