registry_key "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Environment" do
    values [{name: 'SPLUNK_ACCESS_TOKEN', type: :string, data: node['splunk-otel-collector']['splunk_access_token']},
            {name: 'SPLUNK_REALM', type: :string, data: 'us0'},
            {name: 'SPLUNK_CONFIG', type: :string, data: node['splunk-otel-collector']['collector_config_dest']},
            {name: 'SPLUNK_API_URL', type: :string, data: node['splunk-otel-collector']['splunk_api_url']},
            {name: 'SPLUNK_BALLAST_SIZE_MIB', type: :string, data: ''},
            {name: 'SPLUNK_BUNDLE_DIR', type: :string, data: node['splunk-otel-collector']['splunk_bundle_dir']},
            {name: 'SPLUNK_COLLECTD_DIR', type: :string, data: node['splunk-otel-collector']['splunk_collectd_dir']},
            {name: 'SPLUNK_HEC_TOKEN', type: :string, data: node['splunk-otel-collector']['splunk_access_token']},
            {name: 'SPLUNK_HEC_URL', type: :string, data: node['splunk-otel-collector']['splunk_hec_url']},
            {name: 'SPLUNK_INGEST_URL', type: :string, data: node['splunk-otel-collector']['splunk_ingest_url']},
            {name: 'SPLUNK_MEMORY_TOTAL_MIB', type: :string, data: node['splunk-otel-collector']['splunk_memory_total_mib']},
            {name: 'SPLUNK_MEMORY_TOTAL_MIB', type: :string, data: node['splunk-otel-collector']['splunk_ballast_size_mib']},
           ]
     action :create
  end
