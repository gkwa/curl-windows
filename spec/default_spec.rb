require 'chefspec'

describe 'curl-windows::default' do

  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2').converge(described_recipe) }

  it 'unzips curl zip file'
  it 'installs curl.exe'

end
