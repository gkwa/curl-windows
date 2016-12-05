#
# Cookbook Name:: curl-windows
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

windows_zipfile "extract_project" do
  source node['curl']['url']
  path node['curl']['install_dir']
  action :unzip
  not_if {::File.exists?("#{node['curl']['install_dir']}\\curl.exe")}
end
