class LandmarksController < ApplicationController
  get '/show/runs' do 
   #binding.pry
   @run = Runs.where(:user_id => session[:user_id])
 
   
   erb :'/landmarks/runpage'
  end 
 
 post '/run/add' do 
  @run = Runs.all 
  @run = Runs.create(:time => params["time"], :miles => params["miles"], :location => params["location"], :date => params["run_date"], :user_id => session[:user_id])
  @run.save
   redirect '/show/runs' 
 end 
 
 get "/show/runs/:id/edit" do
   @run = Runs.find(params[:id])
   erb :'landmarks/update'
 end 
   
  
 patch '/runs/:id' do 
   @run = Runs.find(params[:id])
   @run.update(:time => params["time"], :miles => params["miles"], :location => params["location"], :date => params["run_date"], :user_id => session[:user_id])
   
 end 
 


end
