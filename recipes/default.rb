#
# Cookbook Name:: curl-windows
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

Chef::Resource::RemoteFile.send(:include, CurlWindows::Helper)


url = node['curl']['url']

remote_file "#{Chef::Config['file_cache_path']}\\#{filename_from_url(url)}" do

end

