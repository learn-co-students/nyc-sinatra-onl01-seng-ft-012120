class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])


    erb :'figures/edit'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    figure.titles.build(params[:title]) if !params[:title][:name].empty?
    figure.landmarks.build(params[:landmark]) if !params[:landmark][:name].empty?
    figure.save
    redirect "figures/#{figure.id}"
  end

  patch '/figures/:id' do
    # binding.pry
    figure = Figure.update(params[:id], params[:figure])
    figure.titles.build(params[:title]) if !params[:title][:name].empty?
    figure.landmarks.build(params[:landmark]) if !params[:landmark][:name].empty?
    figure.save
    # binding.pry
    redirect "/figures/#{figure.id}"
  end




end
