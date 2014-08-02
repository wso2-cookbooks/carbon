#
# Cookbook Name:: carbon
# Recipe:: master_datasources_xml
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

#Generate master_datasources.xml

master_datasources_xml = "#{node['carbon']['product_path']}/#{node["carbon"]["product_name"]}-#{node["carbon"]["product_version"]}/repository/conf/datasources/master-datasources.xml"
  
template master_datasources_xml do
  source 'master-datasources.xml.erb'
  mode 0644
  owner node["carbon"]["user"]
  group node["carbon"]["group"]
  variables(
    :datasources => node['carbon']['datasources'])
end
