module CurlWindows
  module Helper
    def filename_from_url(uri)
      require 'pathname'
      require 'uri'
      Pathname.new(URI.parse(uri).path).basename.to_s
    end
  end
end

Chef::Recipe.send(:include, CurlWindows::Helper)
Chef::Resource.send(:include, CurlWindows::Helper)
