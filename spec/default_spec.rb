require 'chefspec'

describe 'curl-windows::default' do

  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2').converge(described_recipe) }

  it 'downloads zipfile' do
    expect(chef_run).to create_remote_file('zipfile_download')
  end

  it 'notifies the extraction' do
    remote_file = chef_run.remote_file('zipfile_download')
    expect(remote_file).to notify('execute[extract_project]').to(:run)
  end

  it 'unzips curl zip file'
  it 'installs curl.exe'

end
