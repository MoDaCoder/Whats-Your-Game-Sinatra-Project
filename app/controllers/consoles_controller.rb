class ConsolesController < ApplicationController
    # Index Route (display all)
    get '/consoles' do 
        @consoles = Console.all 
        erb :"consoles/index"
    end 

    #newpage(new consoles)
    get '/consoles/new' do 
        erb :"consoles/new"
    end 

    #create route
    post '/consoles' do 
        binding.pry 
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

    #create route
    post '/consoles' do 
        binding.pry
    end 

end 