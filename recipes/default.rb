#
# Cookbook Name:: cherokee
# Recipe:: default
# Author:: Charlie Sharpsteen
#
# Copyright 2011, Charlie Sharpsteen
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
case node[:platform]
when "ubuntu"
  include_recipe "ppa"
  ppa_repository "cherokee-webserver" do
    action :add
  end
end

package 'cherokee'

service 'cherokee' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

