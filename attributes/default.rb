# Cookbook Name:: graphite
# Attributes:: default
#

include_attribute 'apache2'


# Repository for graphite ceres
default['graphite']['megacarbon']['git'] = "https://github.com/graphite-project/carbon.git"
default['graphite']['megacarbon']['branch'] = "megacarbon"

default['graphite']['ceres']['git'] = "https://github.com/graphite-project/ceres.git"
default['graphite']['ceres']['branch'] = "master"

default['graphite']['web']['git'] = "https://github.com/dkulikovsky/graphite-web.git"
default['graphite']['web']['branch'] = "master"


# Logging
default['graphite']['web']['logging']['DEFAULT_CACHE_DURATION'] = 60
default['graphite']['web']['logging']['LOG_RENDERING_PERFORMANCE'] = 'True'
default['graphite']['web']['logging']['LOG_CACHE_PERFORMANCE'] = 'True'
default['graphite']['web']['logging']['LOG_METRIC_ACCESS'] = 'True'

default['graphite']['encrypted_data_bag']['name'] = nil
default['graphite']['web']['password'] = 'change_me'
default['graphite']['chef_role'] = 'graphite'
default['graphite']['url'] = 'graphite'
default['graphite']['url_aliases'] = []
default['graphite']['listen_port'] = 80
default['graphite']['base_dir'] = '/opt/graphite'
default['graphite']['conf_dir'] = '/opt/graphite/conf'
default['graphite']['doc_root'] = '/opt/graphite/webapp'
default['graphite']['storage_dir'] = '/opt/graphite/storage'
default['graphite']['ceres_dir'] = '/opt/graphite/storage/ceres'
default['graphite']['timezone'] = 'America/Los_Angeles'
default['graphite']['web']['django_root'] = '@DJANGO_ROOT@'
default['graphite']['web']['debug'] = 'False'
default['graphite']['web']['bitmap_support'] = true
default['graphite']['web']['admin_email'] = 'admin@org.com'
default['graphite']['web']['cluster_servers'] = []
default['graphite']['web']['carbonlink_hosts'] = []
default['graphite']['web']['memcached_hosts'] = ['127.0.0.1:11211']
default['graphite']['web']['database']['NAME'] = "#{node['graphite']['storage_dir']}/graphite.db"
default['graphite']['web']['database']['ENGINE'] = "django.db.backends.sqlite3"
default['graphite']['web']['database']['USER'] = ""
default['graphite']['web']['database']['PASSWORD'] = ""
default['graphite']['web']['database']['HOST'] = ""
default['graphite']['web']['database']['PORT'] = ""
default['graphite']['web']['ldap']['SERVER'] = ""
default['graphite']['web']['ldap']['BASE_USER'] = ""
default['graphite']['web']['ldap']['BASE_PASS'] = ""
default['graphite']['web']['ldap']['USER_QUERY'] = "(sAMAccountName=%s)"
default['graphite']['web']['ldap']['SEARCH_BASE'] = ""
default['graphite']['web']['email']['BACKEND'] = "django.core.mail.backends.smtp.EmailBackend"
default['graphite']['web']['email']['HOST'] = "localhost"
default['graphite']['web']['email']['PORT'] = "25"
default['graphite']['web']['email']['HOST_USER'] = ""
default['graphite']['web']['email']['HOST_PASSWORD'] = ""
default['graphite']['web']['email']['USE_TLS'] = false
default['graphite']['web_server'] = 'apache'
default['graphite']['create_user'] = false

default['graphite']['graph_templates'] = [
  {
    'name' => 'default',
    'background' => 'black',
    'foreground' => 'white',
    'majorLine' => 'white',
    'minorLine' => 'grey',
    'lineColors' => 'blue,green,red,purple,brown,yellow,aqua,grey,magenta,pink,gold,rose',
    'fontName' => 'Sans',
    'fontSize' => '10',
    'fontBold' => 'False',
    'fontItalic' => 'False'
  }
]

case node['graphite']['web_server']
when 'apache'
  default['graphite']['user_account'] = node['apache']['user']
  default['graphite']['group_account'] = node['apache']['group']
when 'uwsgi'
  default['graphite']['user_account'] = 'graphite'
  default['graphite']['group_account'] = 'graphite'
end

default['graphite']['ssl']['enabled'] = false
default['graphite']['ssl']['cipher_suite'] = 'ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP'
default['graphite']['ssl']['certificate_file'] = '/etc/ssl/server.crt'
default['graphite']['ssl']['certificate_key_file'] = '/etc/ssl/server.key'

default['graphite']['apache']['basic_auth']['enabled'] = false
default['graphite']['apache']['basic_auth']['file_path'] = "#{node['graphite']['doc_root']}/htpasswd"
default['graphite']['apache']['basic_auth']['user'] = nil
default['graphite']['apache']['basic_auth']['pass'] = nil
