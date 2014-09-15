#
# Cookbook Name:: elasticsearch-aws
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'aws'
inslude_recipe 'nginx-proxy'

aws_s3_file "/etc/ssl/private/elasticsearch.key" do
  bucket "keepalert"
  remote_path "applications/ssl/elasticsearch/key.pem"
end
