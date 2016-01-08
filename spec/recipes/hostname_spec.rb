
require 'spec_helper'

describe "ish_vm::hostname" do

  before :each do
    sites_data_bag = {
    }
    stub_data_bag_item("utils", "sites").and_return( stubbed_data_bag )
    # stub_command("/usr/sbin/apache2 -t").and_return(true)
    # stub_command("mysql -usome-username -p -h  -se'USE ;' 2>&1").and_return(true)
  end
  
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['chef_environment'] = '_default'
      # node.set['cookbook']['attribute'] = 'hello'
    end.converge(described_recipe)
  end

  it 'sets hostname' do
    expect(chef_run).to include_recipe("ish_apache::install_apache")
  end
    
end

