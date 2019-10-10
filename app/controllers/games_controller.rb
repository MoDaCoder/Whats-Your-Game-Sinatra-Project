class GamesController < ApplicationController

    get '/games' do 
        erb :games
    end 
end