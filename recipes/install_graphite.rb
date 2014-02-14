# Maksym Naboka 2014
# Cookbook Name:: graphite_ceres
# Recipe:: install_graphite
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'git'

%w{pkg-config libffi-dev}.each do |pkg|
  package "#{pkg}" do
    action :install
  end
end

%w{ceres megacarbon web}.each do |key|
  execute "clone_#{key}" do
    command "git clone #{node['graphite']["#{key}"]['git']} -b #{node['graphite']["#{key}"]['branch']} #{key}"
    creates "#{Chef::Config[:file_cache_path]}/#{key}"
    cwd Chef::Config[:file_cache_path]
  end

  if key == 'web'
    execute "remove cairo dep" do
      command "sed -i '/cairo/d' #{key}/requirements.txt"
      cwd Chef::Config[:file_cache_path]
      not_if "grep -q cairo #{key}/requirements.txt"
    end
    execute "pip_install_cairocffi" do
      command "pip install cairocffi"
      cwd Chef::Config[:file_cache_path]
    end
  end

  execute "install_dep_#{key}" do
    command "pip install -r #{key}/requirements.txt"
    cwd Chef::Config[:file_cache_path]
  end
end
