class Ideas < Sinatra::Base

  get "/" do
    erb :home
  end

  get "/order/new" do
    erb :new
  end

  post "/order" do
  Restaurant.create(
    title: params[:title],
    description: params[:description])
  redirect "/"
  end

  get "/order" do
  @order = Restaurant.all
  erb :restaurant
  end

  get "/restaurant/:id/edit" do
  @order = Restaurant.find(params[:id])
  erb :edit
  end

  put "/restaurant/:id" do
  order = Restaurant.find(params[:id])
  order.update(title: params[:title], description: params[:description])
  redirect "/restaurant"
  end

  delete "/restaurant/:id" do
  Restaurant.find(params[:id]).destroy
  redirect "/restaurant"
  end

end
