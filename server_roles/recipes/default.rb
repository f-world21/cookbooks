#
# Cookbook Name:: server_roles
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("f-world21:opsworks-cookbooks/server_roles is going!")
node[:deploy].each do |application, deploy|
  Chef::Log.info(application)
  Chef::Log.info(deploy)
  deploy = node[:deploy][application]
  Chef::Log.info("after insert deploy variable")
  Chef::Log.info(deploy)
end
