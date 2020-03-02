class FiguresController < ApplicationController
  # add controller methods
  get '/' do 
    redirect to "/figures"
  end

  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end


  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])

    erb :"figures/show"
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @titles = Title.all 
    @landmarks = Landmark.all

    erb :'figures/edit'
  end


  post '/figures' do 
    @figure = Figure.create(params[:figure])

    if !params["landmark"]["name"].empty?
      #landmark1 = Landmark.find_or_create(params["landmark"])
      #@figure.landmarks << Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params["title"]["name"].empty?
      #title1 = Title.find_or_create_by(name: params["title"]["name"])
      #@figure.titles << Title.create(name: params["title"]["name"])
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    
    redirect to "/figures/#{@figure.id}"
  end



  patch "/figures/:id" do 
    @figure = Figure.find_by_id(params[:id])


    @figure.update(params[:figure])
    if !params["landmark"]["name"].empty?
      #landmark1 = Landmark.find_or_create(params["landmark"])
      #@figure.landmarks << Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params["title"]["name"].empty?
      #title1 = Title.find_or_create_by(name: params["title"]["name"])
      #@figure.titles << Title.create(name: params["title"]["name"])
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  delete "figures/:id" do 
    Figure.destroy(params[:id])
    redirect to "/figures"
  end

end
