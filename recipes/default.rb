#
# Cookbook Name:: ish_vm
# Recipe::        default
#
# Formerly ish::base_vm
#
# Copyright 2015, 2016, wasya.co
# All rights reserved - Do Not Redistribute
#
#

include_recipe 'ish::base_aws'

=begin
execute 'apt-get update -y'

node.packages.each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file "screenrc" do
  path "#{homedir}/.screenrc"
  action :create
end

cookbook_file "emacs" do
  path "#{homedir}/.emacs"
  action :create
end
=end




