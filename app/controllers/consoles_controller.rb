class ConsolesController < ApplicationController

    get '/consoles' do 
        @consoles = Console.all 
        erb :"consoles/index"
    end 

    #show page (display one todo)
    get '/consoles/:id' do 

        @console = Console.find_by(id:params[:id])

        if @console
            erb :"consoles/show"
        else 
            redirect '/consoles'
        end 
    end 
end 