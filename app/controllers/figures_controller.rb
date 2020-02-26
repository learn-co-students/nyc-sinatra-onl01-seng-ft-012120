class FiguresController < ApplicationController
  get '/figures/new' do 
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb :'/figures/new'
  end 

  post '/figures' do 
    @figure = Figure.create(params["figure"])
    if params["title"]["name"].length > 0 
      @figure.titles.create(params["title"])
    end 
    if params["landmark"]["name"].length > 0 
      @figure.landmarks.create(params["landmark"])
    end 
    redirect "/figures/#{@figure.id}"
  end 

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end 

  get '/figures' do 
    @figures = Figure.all 
    erb :"figures/index"
  end 

  get "/figures/:id/edit" do 
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all 
    @titles = Title.all 
    erb :"figures/edit"
  end 

  patch "/figures/:id" do 
    @figure = Figure.find(params[:id])
    @figure.update(params["figure"])
    if params["title"]["name"].length > 0 
      @figure.titles.create(params["title"])
    end 
    if params["landmark"]["name"].length > 0 
      @figure.landmarks.create(params["landmark"])
    end 
    redirect "/figures/#{@figure.id}"
  end 

end
