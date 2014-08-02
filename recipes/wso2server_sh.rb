#
# Cookbook Name:: carbon
# Recipe:: wso2server_sh
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
# --------------

wso2server_sh = "#{node['carbon']['product_path']}/#{node["carbon"]["product_name"]}-#{node["carbon"]["product_version"]}/bin/wso2server.sh"

template wso2server_sh do
  source 'wso2server.sh.erb'
  mode 0755
  owner node["carbon"]["user"]
  group node["carbon"]["group"] 
  backup false
  variables(
    :java_home => node['carbon']['java_home'],
    :java_heap_options => node['carbon']['java_heap_options'])
end
