#
# Cookbook Name:: carbon
# Recipe:: carbon_xml
#

#Generate carbon.xml

carbon_xml = "#{node['carbon']['product_path']}/#{node["carbon"]["product_name"]}-#{node["carbon"]["product_version"]}/repository/conf/carbon.xml"

template carbon_xml do
  source 'carbon.xml.erb'
  mode 0644
  owner node["carbon"]["user"]
  group node["carbon"]["group"]
  variables(
	:product_name => node["carbon"]["server_name"],
	:product_version => node["carbon"]["product_version"],
	:server_key => node["carbon"]["server_key"],
	:host_name => node["carbon"]["server_host_name"],
	:server_roles => node["carbon"]["server_roles"],
	:ports_offset => node["carbon"]["server_ports_offset"],
        :axis2_service_path => node["carbon"]["axis2_service_path"],
	:EnableEmailUserName => node["carbon"]["enable_email_user_name"])
end
