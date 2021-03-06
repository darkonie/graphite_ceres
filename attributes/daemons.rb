#
# Cookbook Name:: graphite_ceres
# Attributes:: daemons
#

default['graphite']['daemons'] = [
  {
    'name' => 'write',
    'daemon' => 
      {
        'PIPELINE' => ['write'],
        'USE_INSECURE_UNPICKLER' => 'False'
      },
    'db' =>
      {
        'DATABASE' => 'ceres',
        'LOCAL_DATA_DIR' => "#{node['graphite']['web']['storage_dir']}/ceres",
        'DEFAULT_SLICE_CACHING_BEHAVIOR' => 'latest',
        'MAX_SLICE_GAP' => '80'
      },
    'writer' =>
      {
        'MAX_CACHE_SIZE' => 'inf',
        'USE_FLOW_CONTROL' => 'False',
        'MAX_WRITES_PER_SECOND' => '6000',
        'MAX_CREATES_PER_MINUTE' => '5000',
        'LOG_WRITES' => 'False',
        'LOG_CACHE_HITS' => 'False',
        'CACHE_QUERY_INTERFACE' => '0.0.0.0',
        'CACHE_QUERY_PORT' => 7002,
        'CACHE_DRAIN_STRATEGY' => 'sorted',
        'WHITELISTS_DIR' => "#{node['graphite']['storage_dir']}/lists"
      },
    'listeners' =>
      {
        'plaintext_reciver' => 
          {
            'protocol' => 'udp',
	    'interface' => '0.0.0.0',
            'port' => 2003,
            'type' => 'plaintext-receiver'
          },
        'pickle_reciver' => {
            'protocol' => 'tcp',
            'interface' => '0.0.0.0',
            'port' => 2004,
            'type' => 'pickle-receiver'
        }
      },
    'aggregation' => {},
    'aggregation-filters' => {},
    'aggregation-rules' => {},
    'filter-rules' => {},
    'management' => {},
    'relay' => {},
    'relay-rules' => {},
    'rewrite-rules' => {},
    'storage-rules' => [
      {
        'name' => 'defaults',
        'match-all' => true,
        'retention' => '1m:30d',
        'aggregation-method' => 'average'
      }	
    ]
  }
]
