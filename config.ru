require 'sinatra/base'
require 'active_record'
require './config/environment'

Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }
map('/') {run ApplicationController}
map('/customers') {run CustomerController}
map('/suppliers') {run SupplierController}
