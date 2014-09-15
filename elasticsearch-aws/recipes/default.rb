#
# Cookbook Name:: elasticsearch-aws
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'aws'

directory "/etc/ssl/private" do
  action :create
end

aws_s3_file "/etc/ssl/private/elasticsearch.key" do
  bucket "keepalert"
  remote_path "applications/ssl/elasticsearch/key.pem"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end

aws_s3_file "/etc/ssl/certs/elasticsearch.pem" do
  bucket "keepalert"
  remote_path "applications/ssl/elasticsearch/cert.pem"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end

nginx_proxy "elasticsearch.keepalert.com" do
  ssl_key "elasticsearch"
  port 9200
end
