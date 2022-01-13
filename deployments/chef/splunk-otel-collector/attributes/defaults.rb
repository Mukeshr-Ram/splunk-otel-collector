default['splunk-otel-collector']['splunk_repo_base_url'] = 'https://splunk.jfrog.io/splunk'
default['splunk-otel-collector']['fluentd_base_url'] = 'https://packages.treasuredata.com'
default['splunk-otel-collector']['package_stage'] = 'release'
default['splunk-otel-collector']['windows_repo_url'] = 'https://dl.signalfx.com'
default['splunk-otel-collector']['service_name'] = 'splunk-otel-collector'
default['splunk-otel-collector']['splunk_access_token'] = 'MY_TOKEN'
default['splunk-otel-collector']['splunk_realm'] = 'us0'
default['splunk-otel-collector']['collector_version'] = 'latest'
default['splunk-otel-collector']['td_agent_version'] = '4.1.1'


case node['platform_family']
when 'windows'
  default['splunk-otel-collector']['collector_install_dir'] = '\Program Files\Splunk\OpenTelemetry Collector'
  default['splunk-otel-collector']['splunk_ingest_url'] = "https://ingest.#{node['splunk-otel-collector']['splunk_realm']}.signalfx.com"
  default['splunk-otel-collector']['splunk_api_url'] = "https://api.#{node['splunk-otel-collector']['splunk_realm']}.signalfx.com"
  default['splunk-otel-collector']['splunk_trace_url'] = "#{node['splunk-otel-collector']['splunk_ingest_url']}/v2/trace"
  default['splunk-otel-collector']['splunk_hec_url'] = "#{node['splunk-otel-collector']['splunk_ingest_url']}/v2/trace"
  default['splunk-otel-collector']['collector_config_dir'] = '\ProgramData\Splunk\OpenTelemetry Collector'
  default['splunk-otel-collector']['collector_config_source'] = "#{node['splunk-otel-collector']['collector_install_dir']}\\agent_config.yaml"
  default['splunk-otel-collector']['collector_config_dest'] = "#{node['splunk-otel-collector']['collector_config_dir']}\\agent_config.yaml"
  default['splunk-otel-collector']['splunk_bundle_dir'] = "#{node['splunk-otel-collector']['collector_install_dir']}\\agent-bundle"
  default['splunk-otel-collector']['splunk_collectd_dir'] = "#{node['splunk-otel-collector']['collector_install_dir']}\\run\\collectd"
  default['splunk-otel-collector']['splunk_memory_total_mib'] = '512'
  default['splunk-otel-collector']['splunk_ballast_size_mib'] = ''
  default['splunk-otel-collector']['fluentd_config_source'] = "#{node['splunk-otel-collector']['collector_install_dir']}\\fluentd\\td-agent.conf"
  default['splunk-otel-collector']['fluentd_config_dest'] = 'file:\\\opt\td-agent\etc\td-agent\td-agent.conf'
  default['splunk-otel-collector']['collector_version_url'] = "#{node['splunk-otel-collector']['windows_repo_url']}/#{node['splunk-otel-collector']['service_name']}/msi/#{node['splunk-otel-collector']['package_stage']}/latest.txt"
  default['splunk-otel-collector']['package_url'] = "#{node['splunk-otel-collector']['windows_repo_url']}/#{node['splunk-otel-collector']['service_name']}/msi/#{node['splunk-otel-collector']['package_stage']}/splunk-otel-collector-#{node['splunk-otel-collector']['collector_version']}-amd64.msi"
end
