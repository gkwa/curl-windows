require 'spec_helper'

describe 'curl-windows::default' do

  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'windows', version: '2012').converge('curl-windows::default') }

  it 'downloads curl zip' do
    expect(chef_run).to create_remote_file("#{Chef::Config['file_cache_path']}\\curl-7.51.0-win32-VC14.zip")
  end

  it 'unzips curl zip file'
  it 'installs curl.exe'

end
