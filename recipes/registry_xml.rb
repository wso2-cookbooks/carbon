#
# Cookbook Name:: carbon
# Recipe:: registry_xml
#
# ----------------------------------------------------------------------------
#  Copyright 2005-2014 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------

#Genarate registry.xml
registry_xml = "#{node['carbon']['product_path']}/#{node["carbon"]["product_name"]}-#{node["carbon"]["product_version"]}/repository/conf/registry.xml"

registry_xml_tmpl = "registry.xml.erb"

case node["carbon"]["server_key"]
when "GReg"
        registry_xml_tmpl = "greg-registry.xml.erb"
end

template registry_xml do
  source registry_xml_tmpl
  mode 0644
  owner node["carbon"]["user"]
  group node["carbon"]["group"] 
  variables(
    :mounted_registry_dataSource => node['carbon']['mounted_registry_dataSource'],
    :jdbc_url => node['carbon']['registry_jdbc_url'],
    :database_user => node['carbon']['registry_database_user'],
    :config_registry_target => node['carbon']['config_registry_target'],
    :version_resources_onchange => node['carbon']['versionResourcesOnChange'])
end
