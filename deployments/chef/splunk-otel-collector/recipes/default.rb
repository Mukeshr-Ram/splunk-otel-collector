if node['platform_family'] == 'windows'
  include_recipe 'splunk-otel-collector::win_otel_latest'
  #include_recipe 'splunk-otel-collector::win'
  include_recipe 'splunk-otel-collector::collector_win_registry'
end

if node['platform_family'] == 'windows'
  include_recipe 'splunk-otel-collector::win_fluentd'
end
