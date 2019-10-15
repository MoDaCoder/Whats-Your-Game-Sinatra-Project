class SessionsController < ApplicationController

    get '/login' do 
      #sessions controller
      # @user = User.first
      #user should come from the session controller
      # @consoles = @user.consoles
      erb :"session/login"
      #displays consoles user owns
    end 

    post '/login' do 
      # binding.pry 
      #figure out if user exist in db
      @user = User.find_by(email:params[:email])
      #if they do exist verify password
      if @user && @user.authenticate(params[:password])
        #set our session hash and redirect accordingly 
        session[:user_id] = @user.id 
        redirect '/consoles'
      else
        redirect '/login'
      end
    
    end 


end 