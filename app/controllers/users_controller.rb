class UsersController < ApplicationController

    get '/user' do 
      #sessions controller
      @user = User.first
      #user should come from the session controller
      @consoles = @user.consoles
      erb :"consoles/index"
      #displays consoles user owns
    end 
end 