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
end
