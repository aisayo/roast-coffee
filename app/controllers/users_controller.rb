class UsersController < ApplicationController
  
  get '/signup' do 
    erb :'/users/signup'
  end 
  
  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])
    
    if user.save && !user,username.empty?
      redirect '/login'
    else 
      redirect '/'
    end 
  end 
  
  get '/login' do
    erb :'/users/login'
  end 
  
  post '/login' do
    @user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect '/login'
    else 
      redirect '/'
    end 
  end 
  
  get '/logout' do 
    session.clear
    redirect '/'
  end 
end 