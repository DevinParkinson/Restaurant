class Ideas < Sinatra::Base

  get "/" do
    erb :home
  end

  get "/order/new" do
    erb :new
  end

  post "/order" do
  Order.create(
    title: params[:title],
    description: params[:description])
  redirect "/restaurant"
  end

  get "/restaurant" do
  @order = Order.all
  erb :restaurant
  end

  get "/restaurant/:id/edit" do
  @order = Order.find(params[:id])
  erb :edit
  end

  put "/restaurant/:id" do
  order = Order.find(params[:id])
  order.update(title: params[:title], description: params[:description])
  redirect "/restaurant"
  end

  delete "/restaurant/:id" do
  Order.find(params[:id]).destroy
  redirect "/restaurant"
  end

end
