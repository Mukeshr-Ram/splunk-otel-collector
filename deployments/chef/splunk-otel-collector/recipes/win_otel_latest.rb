directory '\temp\\' do
    action :create
    recursive true
end

remote_file '\temp\latest.txt' do
    source "#{node['splunk-otel-collector']['windows_repo_url']}/#{node['splunk-otel-collector']['service_name']}/msi/#{node['splunk-otel-collector']['package_stage']}/latest.txt"
    action :create
end

if node.default['splunk-otel-collector']['collector_version'] = 'latest'
    node.default['splunk-otel-collector']['collector_version'] = ::File.read('\temp\latest.txt') if File.exist?('\temp\latest.txt')

else
    node.default['splunk-otel-collector']['collector_version']
end

remote_file 'Download msi' do 
    path "\\temp\\splunk-otel-collector-#{node['splunk-otel-collector']['collector_version']}-amd64.msi"
    source "#{node['splunk-otel-collector']['windows_repo_url']}/#{node['splunk-otel-collector']['service_name']}/msi/#{node['splunk-otel-collector']['package_stage']}/splunk-otel-collector-#{node['splunk-otel-collector']['collector_version']}-amd64.msi"
    action :create
end

windows_package 'splunk-otel-collector' do
    source "\\temp\\splunk-otel-collector-#{node['splunk-otel-collector']['collector_version']}-amd64.msi"
    action :install
end