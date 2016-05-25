#
# Cookbook Name:: server_roles
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("f-world21:opsworks-cookbooks/server_roles is going!")
Chef::Log.info("inspect node[:deploy] object")
Chef::Log.info(node[:deploy])
node[:deploy].each do |application, deploy_value|
  Chef::Log.info(application)
  Chef::Log.info(deploy_value)

  Chef::Log.info("create #{deploy_value[:deploy_to]}/shared/config dir if not exist")
  directory "#{deploy_value[:deploy_to]}/shared/config" do
    owner "deploy"
    group "www-data"
    mode 0774
    recursive true
    action :create
  end

  Chef::Log.info("create app_data.yml")
  file File.join(deploy_value[:deploy_to], 'shared', 'config', 'app_data.yml') do
    content YAML.dump(deploy_value[:server_roles].to_hash)
  end
end
