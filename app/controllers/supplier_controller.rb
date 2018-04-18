class SupplierController < ApplicationController
  configure do
    set :root, File.join(File.dirname(__FILE__))
    set :views, Proc.new {File.join(root, "../views/suppliers")}
  end

  get '/' do
    "I'm still inside the supplier controller. #{__FILE__}<br>#{File.dirname(__FILE__)}."
    @suppliers = Supplier.all
    erb :index
  end
  get '/new' do
    erb :new
  end
  post "/create" do
    Supplier.create(params[:supplier])
    # "#{params[:supplier]}"
    redirect "/suppliers"
  end
  get "/:id/edit" do
    @supplier = Supplier.find(params[:id])
    erb :edit
  end
  get "/:id/update" do
    @supplier = Supplier.find(params[:id])
    @supplier.update_attributes(params[:supplier])

    redirect "/suppliers"
  end
  get "/:id/delete" do
    @supplier = Supplier.find(params[:id])

    erb :delete
  end

  post "/:id/delete" do
    if (params[:_method] == 'DELETE')
      @supplier = Supplier.find(params[:id])
      @supplier.delete
    end

    redirect "/suppliers"
  end
end