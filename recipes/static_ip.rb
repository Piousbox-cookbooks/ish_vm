
#
# 20150725
# Give a VM a new static ip.
#
# VMs are initialized from a common ancestor who has one ip. To be funkt, new vms need an IP of their own.
#

def puts! args, label=""
  puts "+++ +++ #{label}"
  puts args.inspect
end

puts! node['static_ip'], 'static ip to assign is'

static_ip = node['static_ip']
if static_ip
  template "/etc/network/interfaces" do
    source "etc/network/interfaces.erb"
    mode "0664"  
    variables(
      :static_ip => static_ip
    )
  end
end
