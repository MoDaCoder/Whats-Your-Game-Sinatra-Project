class ConsolesController < ApplicationController

    get '/consoles' do 
        @consoles = Console.all 
        erb :"consoles/index"
    end 

    #show page (display one console)
    get '/consoles/:id' do 

        @console = Console.find_by(id:params[:id])

        if @console
            erb :"user/owns"
        else 
            redirect '/consoles'
        end 
    end 
end 