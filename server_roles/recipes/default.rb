#
# Cookbook Name:: server_roles
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.debug("f-world21:opsworks-cookbooks/server_roles is going!")
node[:deploy].each do |application, deploy|
  Chef::Log.debug(application)
  Chef::Log.debug(deploy)
  deploy = node[:deploy][application]
  Chef::Log.debug("after insert deploy variable")
  Chef::Log.debug(deploy)
end
