default["carbon"]["artifact_url"] = "http://localhost/wso2"
default["carbon"]["artifact_name"] = "wso2carbon-4.2.0.zip"
default["carbon"]["artifact_checksum"] ="9289aee22a6c6347388efe22aac36272f36bff3b9862fc66ae388e2576d32de8"

default["carbon"]["java_home"] = "/opt/java/jdk"
default["carbon"]["product_path"] = "/opt/wso2"
default["carbon"]["java_heap_options"] = "-Xms512m -Xmx2048m -XX:MaxPermSize=512m"

default["carbon"]["jdbc_url"] = "jdbc:mysql://localhost:3306/wso2"
default["carbon"]["database_user"] = "dbuser"
default["carbon"]["database_password"] = "passwd4mysql"

default["carbon"]["product_name"] = "wso2carbon"
default["carbon"]["product_version"] = "4.2.0"

default["carbon"]["user"] = "wso2carbon"
default["carbon"]["group"] = "wso2carbon"
default["carbon"]["user_shell"] = "/bin/sh"
default["carbon"]["user_comment"] = "WSO2 User"

default["carbon"]["repository_lib"] = "/repository/components/lib"
default['carbon']["carbon_common_libs"] = ['mysql-connector-java-5.1.30-bin.jar']
default["carbon"]["common_lib_url"] = "http://localhost/libs"
default["carbon"]["common_lib_path"] = "/repository/components/lib"

default["carbon"]["patch_url"] = "http://localhost/patches"
default["carbon"]["patch_path"] = "/repository/components/patches"
default['carbon']["patches"] = ["patch001.zip", "patch002.zip"]

default["carbon"]["keystore_url"] = "http://localhost/keystores"
default["carbon"]["keystore_path"] = "repository/resources/security"
default['carbon']['carbon_keystores'] = ["wso2carbon.jks","client-truststore.jks"]

default["carbon"]["server_name"] = "WSO2 Carbon"
default["carbon"]["server_key"] = "Carbon"
default["carbon"]["server_host_name"] = "localhost"
default["carbon"]["server_roles"] = ["CarbonServer"]
default["carbon"]["server_ports_offset"] = "0"
default["carbon"]["enable_email_user_name"] = "true"

default["carbon"]["datasources"] = [{		name:'WSO2_RDS_DB_UM',
						description:"Datasource for user manager",
						jndiConfig_name:"jdbc/WSO2DBUM",
						jdbc_url:"jdbc:mysql://localhost:3306/wso2_um",
						database_user:"dbuser",database_password:"passwd4mysql",
						driver_class_name:"com.mysql.jdbc.Driver",
						max_active:"50",max_wait:"60000",
						validation_query:"SELECT 1",
						validation_interval:"30000"},
						
					{	name:'WSO2_RDS_DB_Reg',
						description:"Datasource for Registry",
						jndiConfig_name:"jdbc/WSO2DBReg",
						jdbc_url:"jdbc:mysql://localhost:3306/wso2_reg",
						database_user:"dbuser",database_password:"passwd4mysql",
						driver_class_name:"com.mysql.jdbc.Driver",
						max_active:"50",max_wait:"60000",
						validation_query:"SELECT 1",
						validation_interval:"30000"}]

default['carbon']['registry_jdbc_url'] = "jdbc:mysql://localhost:3306/wso2_reg"
default["carbon"]["registry_database_user"] = "dbuser"
default['carbon']['mounted_registry_dataSource'] = "jdbc/WSO2DBReg"
default['carbon']['config_registry_target'] = "/_system/carbonconfig"
default['carbon']['versionResourcesOnChange'] = "true"

