# Maksym Naboka 2014
# Cookbook Name:: graphite_ceres
# Recipe:: initialize_db
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
execute 'init db' do
  command "#{node['graphite']['base_dir']}/bin/ceres-tree-create #{node['graphite']['ceres_dir']}"
  creates "#{node['graphite']['ceres_dir']}/.ceres-tree"
#  user node['graphite']['group_account']
end
