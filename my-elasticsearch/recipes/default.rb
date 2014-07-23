#
# Cookbook Name:: my-elasticsearch
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'elasticsearch::default'

template "whois_mapping.json" do
	path "#{node.elasticsearch[:path][:conf]}/mappings/_default/whois.json"
	source "whois_mapping.json.erb"
	owner node.elasticsearch[:user] and group node.elasticsearch[:user] and mode 0755
	
	notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
end
