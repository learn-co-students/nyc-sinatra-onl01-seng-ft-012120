class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do

    erb :'figures/index'
  end
  get '/figures/new' do

    erb :'figures/new'
  end
end
