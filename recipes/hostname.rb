
def puts! args, label=""
  puts "+++ +++ #{label}"
  puts args.inspect
end

puts! node['hostname'], 'hostname is'
