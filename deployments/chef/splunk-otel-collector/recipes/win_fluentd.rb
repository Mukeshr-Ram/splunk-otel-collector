directory '\temp\\' do
    action :create
    recursive true
end

remote_file "/temp/td-agent-#{node['splunk-otel-collector']['td_agent_version']}-x64.msi" do
    source "#{node['splunk-otel-collector']['fluentd_base_url']}/4/windows/td-agent-#{node['splunk-otel-collector']['td_agent_version']}-x64.msi"
    action :create
end

windows_package 'fluentd' do
    source "/temp/td-agent-#{node['splunk-otel-collector']['td_agent_version']}-x64.msi"
    action :install
end

