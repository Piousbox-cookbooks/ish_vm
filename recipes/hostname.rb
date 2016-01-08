
#
# recipe ish_vm::hostname
# 20160108
#
# set the hostname
#
# node['network']['interfaces'].each { |k, v| v['addresses'].each { |kk, vv| puts kk }  }; 0
#
#

addresses = []
node['network']['interfaces'].each do |if_name, if_hash|
  if_hash['addresses'].each do |address, address_hash|
    if 'inet' == address_hash['family']
      addresses.push address
    end
  end
end

hostname = nil
sites = data_bag_item('utils', 'sites')['sites']
sites.each do |site| # search sites, get the hostname that belongs to me.
  if addresses.include? site['ipaddress']
    hostname = site['domains'][0]
  end
end

file "/etc/hostname" do
  content hostname
  only_if { hostname }
end
