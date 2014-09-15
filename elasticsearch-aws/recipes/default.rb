#
# Cookbook Name:: elasticsearch-aws
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'aws'

aws_s3_file "/etc/key.pem" do
  bucket "keepalert"
  remote_path "applications/ssl/elasticsearch/key.pem"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end
