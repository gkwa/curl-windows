#
# Cookbook Name:: curl-windows
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'extract_project' do
  command "tar xfvz #{Chef::Config[:file_cache_path]}\\#{filename_from_url(node['curl']['url'])}"
  action :nothing
end

remote_file "zipfile_download" do
  path "#{Chef::Config['file_cache_path']}\\#{filename_from_url(node['curl']['url'])}"
  source node['curl']['url']
  notifies :run, 'execute[extract_project]', :immediately
end
