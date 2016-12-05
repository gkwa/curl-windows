#
# Cookbook Name:: curl-windows
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

Chef::Resource::RemoteFile.send(:include, CurlWindows::Helper)

url = node['curl']['url']
app_dir = "c:\\Program Files\\Curl\\"

execute 'extract_project' do
  command "tar xfvz #{Chef::Config[:file_cache_path]}\\#{filename_from_url(url)}"
  # cwd base_dir
  # action (File.exist?(app_dir) ? :nothing : :run)
  # subscribes :run, "zipfile_download"
  # notifies :create, 'remote_file[zipfile_download]', :immediately
  action :nothing
end


remote_file "zipfile_download" do
  path "#{Chef::Config['file_cache_path']}\\#{filename_from_url(url)}"
  source url
  use_last_modified true
  use_conditional_get true
  notifies :run, 'execute[extract_project]', :immediately
end
