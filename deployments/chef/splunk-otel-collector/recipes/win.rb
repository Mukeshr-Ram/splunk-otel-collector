directory '\temp\\' do
    action :create
end

remote_file 'Download msi' do
    path "\\temp\\splunk-otel-collector-#{node['splunk-otel-collector']['collector_version']}-amd64.msi" 
    source "#{node.default['splunk-otel-collector']['package_url']}"
    action :create
end

windows_package 'splunk-otel-collector' do
    source "\\temp\\splunk-otel-collector-#{node['splunk-otel-collector']['collector_version']}-amd64.msi"
    action :install
end
