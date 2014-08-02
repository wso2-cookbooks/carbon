#
# Cookbook Name:: carbon
# Recipe:: deploy_server
#

#Add user for WSO2 daemon.
user "#{node["carbon"]["user"]}" do
  comment  node["carbon"]["user_comment"]
  shell node["carbon"]["user_shell"]
  supports :manage_home => true
end

#Download the WSO2 Product
carbon_latest = "#{Chef::Config['file_cache_path']}/#{node["carbon"]["artifact_name"]}"

remote_file carbon_latest do
  source  node["carbon"]["artifact_url"] + "/" + node["carbon"]["artifact_name"] 
  owner node["carbon"]["user"]
  mode "0644"
  checksum node["carbon"]["artifact_checksum"]
end

#Create WSO2 product installation path
directory node["carbon"]["product_path"] do
  owner node["carbon"]["user"]
  group node["carbon"]["group"]
  mode "0755"
  action :create
  recursive true
end

#Extract the WSO2 product
carbon_home = "#{node['carbon']['product_path']}/#{ node["carbon"]["product_name"]}-#{node["carbon"]["product_version"]}"
carbon_home_link = "#{node['carbon']['product_path']}/#{ node["carbon"]["product_name"]}"

product_extract_path = "#{node["carbon"]["product_path"]}"

bash "extract_wso2_product" do
  cwd ::File.dirname(carbon_latest)
    code <<-EOH
	unzip #{carbon_latest} -d #{product_extract_path}
        chown -R #{node["carbon"]["user"]}:#{node["carbon"]["group"]}  #{carbon_home}
        ln -s #{carbon_home} #{carbon_home_link}
  EOH
  not_if {::File.exists?(carbon_home)}
end
