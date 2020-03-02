class LandmarksController < ApplicationController
  # add controller methods
    # add controller methods
    
  
    get '/landmarks' do 
      @landmarks = Landmark.all 
      figures = Figure.all
      erb :'landmarks/index'
    end
  
    get '/landmarks/new' do 
      erb :'landmarks/new'
    end

    get '/landmarks/:id' do 
      @landmark = Landmark.find_by_id(params[:id])
  
      erb :'landmarks/show'
    end


    get '/landmarks/:id/edit' do 
      @landmark = Landmark.find_by_id(params[:id])
  
      erb :"landmarks/edit"
    end
  
  
    post '/landmarks' do 
      @landmark = Landmark.create(params[:landmark])
      
      redirect to "/landmarks"
    end
  
  
  
    patch "/landmarks/:id" do 
      @landmark = Landmark.find(params[:id])
  
  
      @landmark.update(params[:landmark])
      redirect to "/landmarks/#{@landmark.id}"
    end

  
    delete "landmarks/:id" do 
      landmark.destroy(params[:id])
      redirect to "/landmarks"
    end
  
  
  
end
