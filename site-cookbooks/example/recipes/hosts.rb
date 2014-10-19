#
# Cookbook Name:: example
# Recipe:: hosts
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

hostsfile_entry '127.0.0.1' do
  hostname  'localtest.example.com'
  aliases   [
              'aliases1.example.com',
              'aliases2.example.com'
            ]
  action    :create_if_missing
end
