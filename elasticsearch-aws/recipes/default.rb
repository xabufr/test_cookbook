#
# Cookbook Name:: elasticsearch-aws
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'aws'

::Chef::Recipe.send(:include, Opscode::Aws::Ec2)

creds = query_role_credentials

aws_s3_file "/etc/key.pem" do
  bucket "keepalert"
  remote_path "applications/ssl/elasticsearch/key.pem"
  aws_access_key_id creds['AccessKeyId']
  aws_secret_access_key creds['SecretAccessKey']
end
