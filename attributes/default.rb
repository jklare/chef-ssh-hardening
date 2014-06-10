# encoding: utf-8
#
# Cookbook Name:: ssh-hardening
# Attributes:: default
#
# Copyright 2012, Dominik Richter
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

# Define the client package name
case platform
when 'redhat', 'centos', 'fedora', 'amazon', 'oracle', 'scientific'
  default['sslclient']['package'] = 'openssh-clients'
when 'debian', 'ubuntu'
  default['sslclient']['package'] = 'openssh-client'
when 'arch'
  default['sslclient']['package'] = 'openssh'
else
  default['sslclient']['package'] = 'openssh-client'
end

# Define the server package name
default['sslserver']['package'] = 'openssh-server'

default['config_disclaimer']              = '**Note:** This file was automatically created by Pinerolo configuration. If you use its automated setup, do not edit this file directly, but adjust the automation instead.'
default['network']['ipv6']['enable']      = false   # sshd + ssh
default['ssh']['cbc_required']            = false   # sshd + ssh
default['ssh']['weak_hmac']               = false   # sshd + ssh
default['ssh']['weak_kex']                = false   # sshd + ssh
default['ssh']['ports']                   = [22]  # sshd + ssh
default['ssh']['listen_to']               = ['0.0.0.0']     # sshd
default['ssh']['host_key_files']          = ['/etc/ssh/ssh_host_rsa_key', '/etc/ssh/ssh_host_dsa_key', '/etc/ssh/ssh_host_ecdsa_key']     # sshd
default['ssh']['client_alive_interval']   = 600     # sshd, 10min
default['ssh']['client_alive_count']      = 3       # sshd, ~> 3 x interval
default['ssh']['remote_hosts']            = []     # ssh
default['ssh']['allow_root_with_key']     = false   # sshd
default['ssh']['allow_tcp_forwarding']    = false   # sshd
default['ssh']['allow_agent_forwarding']  = false   # sshd
