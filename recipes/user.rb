#
# Cookbook Name:: graphite_ceres
# Recipe:: user
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

group node['graphite']['group_account'] do
  system true
  action :create
  only_if { node['graphite']['create_user'] }
end

user node['graphite']['user_account'] do
  system true
  group node['graphite']['group_account']
  home '/var/lib/graphite'
  shell '/bin/none'
  action :create
  only_if { node['graphite']['create_user'] }
end
