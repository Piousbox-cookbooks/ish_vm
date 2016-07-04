name             'ish_vm'
maintainer       'victor@wasya.co'
maintainer_email 'victor@wasya.co'
license          'All rights reserved'
description      'Installs/Configures ish_vm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w( ish ).each do |cookbook|
  depends cookbook
end

%w{ ubuntu debian }.each do |os|
  supports os
end


