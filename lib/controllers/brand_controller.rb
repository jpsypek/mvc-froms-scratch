class BrandController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views")}

  get '/brands' do
    @brands = Brand.all
    erb :"brands/index"
  end

  get '/brands/new' do
    erb :"brands/new"
  end

  post '/brands' do
    brand = Brand.create(params)
    redirect "/brands"
  end

  get '/brands/:id/edit' do
    @brand = Brand.find(params[:id])
    erb :"brands/edit"
  end

  get '/brands/:id' do
    @brand = Brand.find(params[:id])
    erb :"brands/view"
  end

  patch '/brands/:id' do
    brand = Brand.find(params[:id])
    brand.update(name: params[:name])
    redirect "/brands"
  end

  delete '/brands/:id' do
    brand = Brand.find(params[:id])
    brand.destroy
    redirect "/brands"
  end
end
