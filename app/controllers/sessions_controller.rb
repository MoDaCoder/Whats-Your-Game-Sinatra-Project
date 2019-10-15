class SessionsController < ApplicationController

    get '/login' do 
      #user should come from the session controller
      erb :"session/login"
    end 

    post '/login' do 
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

    get '/signup' do 
      erb :"session/signup"
    end 

    post '/session' do 
      @user = User.new
      @user.email = params[:email]
      if params[:psw] == params["psw-repeat"]
        @user.password = params[:psw]
      else 
        redirect '/console'
      end
      if @user.save
        redirect '/login'
      else 
        erb :"session/signup"
      end 
   end 
end 