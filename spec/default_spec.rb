require 'spec_helper'

describe 'curl-windows::default' do

  require 'chefspec'

  describe 'curl-windows::default' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2012').converge(described_recipe) }


    # it 'deletes a file with an explicit action' do
    #   expect(chef_run).to delete_file('/tmp/explicit_action')
    #   expect(chef_run).to_not delete_file('/tmp/not_explicit_action')
    # end
    #
    # it 'deletes a file with attributes' do
    #   expect(chef_run).to delete_file('/tmp/with_attributes').with(backup: false)
    #   expect(chef_run).to_not delete_file('/tmp/with_attributes').with(backup: true)
    # end

    it 'downloads zipfile' do
      url = 'https://www.apachelounge.com/download/VC14/binaries/curl-7.51.0-win32-VC14.zip'
      # expect(chef_run).to create_remote_file("#{Chef::Config['file_cache_path']}\\#{filename_from_url(url)}")
      expect(chef_run).to create_remote_file('zipfile_download')
    end

    it 'notifies the extraction' do
      remote_file = chef_run.remote_file('zipfile_download')
      expect(remote_file).to notify('execute[extract_project]').to(:run)
    end

    # it 'downloads the remote_file only if it\'s changed' do
    #   expect(chef_run).to create_remote_file('codebase_download').with(use_conditional_get: true)
    # end

  end


  #
  # context 'windows' do
  #   let(:chef_run) do
  #     runner = ChefSpec::SoloRunner.new(
  #         'platform' => 'windows',
  #         'version' => '2008R2'
  #     )
  #     runner.node.set['culr']['url'] = 'https://www.apachelounge.com/download/VC14/binaries/curl-7.51.0-win32-VC14.zip'
  #     runner.converge('curl-windows::default')
  #   end
  #
  #   it 'should include the windows recipe' do
  #     # chef_run.should include_recipe 'java::windows'
  #     # chef_run.should create_remote_file "c:\\windows\\temp\\curl-7.51.0-win32-VC14.zip"
  #
  #   end
  # end


  # let (:chef_run) { ChefSpec::ChefRunner.new.converge('curl-windows::default') }
  #
  # context 'windows' do
  #   let(:chef_run) do
  #     runner = ChefSpec::SoloRunner.new(
  #         'platform' => 'windows',
  #         'version' => '2008R2'
  #     )
  #     runner.node.set['culr']['url'] = 'https://www.apachelounge.com/download/VC14/binaries/curl-7.51.0-win32-VC14.zip'
  #     runner.converge('curl-windows::default')
  #   end
  #
  #   it 'should include the windows recipe' do
  #     # chef_run.should include_recipe 'java::windows'
  #     chef_run.should create_remote_file "c:\\windows\\temp\\curl-7.51.0-win32-VC14.zip"
  #
  #   end
  # end

  # before do
  #   Fauxhai.mock(platform: 'windows', version: '2012') do |node|
  #     node['curl']['url'] = 'https://www.apachelounge.com/download/VC14/binaries/curl-7.51.0-win32-VC14.zip'
  #   end
  # end
  #
  # let(:chef_run) { ChefSpec::ChefRunner.new.converge('curl-windows::default') }
  #
  # it 'fetches zip file' do
  #   chef_run.should create_remote_file "c:\\windows\\temp\\curl-7.51.0-win32-VC14.zip"
  # end


  # it 'downloads curl zip' do
  #   @runner = ChefSpec::ChefRunner.new.converge('curl-windows::default')
  #   # @runner = expect(chef_run).to create_remote_file("c:\\windows\\temp\\curl-7.51.0-win32-VC14.zip")
  #   @runner.should create_file("c:\\windows\\temp\\curl-7.51.0-win32-VC14.zip")
  # end

  it 'unzips curl zip file'
  it 'installs curl.exe'

end
