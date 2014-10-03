include_recipe 'aws'

aws_s3_file "/etc/cron.d/elasticsearch-cron.sh" do
  bucket "keepalert"
  remote_path "applications/scripts/elasticsearch-cron.sh"
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
end

file "/etc/cron.d/elasticsearch-cron.sh" do
  owner 'root' and group 'root' and mode 0777
  action :touch
end

cron "elasticsearch-snapshot" do
    hour "0"
    minute "10"
    weekday "*"
    command "/etc/cron.d/elasticsearch-cron.sh"
end
