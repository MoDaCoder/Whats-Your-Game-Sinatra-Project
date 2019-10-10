class ConsolesController < ApplicationController

    get '/consoles' do 
        erb :console/:index
    end 
end 