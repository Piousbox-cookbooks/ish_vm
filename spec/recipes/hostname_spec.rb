
require 'spec_helper'

describe "ish_vm::hostname" do

  before :each do
    sites_data_bag = {
      'sites' => [
        {
          'id' => 'some-id',
          'domains' => [ 'localhost-special' ],
          'ipaddress' => '127.0.0.1'
        },
        {}
      ]
    }
    stub_data_bag_item("utils", "sites").and_return( sites_data_bag )
    # stub_command("/usr/sbin/apache2 -t").and_return(true)
    # stub_command("mysql -usome-username -p -h  -se'USE ;' 2>&1").and_return(true)
  end
  
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['network'] = {
        'interfaces' => {
          'eth0' => {
            'addresses' => {
              '127.0.0.1' => {
                'family' => 'inet'
              }
            }
          }
        }
      }
    end.converge(described_recipe)
  end

  it 'sets hostname' do
    expect(chef_run).to create_file( "/etc/hostname" ).with( :content => 'localhost-special' )
  end
    
end

