class CustomerController < ApplicationController
  configure do
    set :root, File.join(File.dirname(__FILE__), '')
    # sets the view directory correctly
    set :views, Proc.new { File.join(root, "../views/customers") }
  end

  get '/' do
    erb :index
  end
end