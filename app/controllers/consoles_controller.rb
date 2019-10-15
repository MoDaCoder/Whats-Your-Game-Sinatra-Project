class ConsolesController < ApplicationController
    # Index Route (display all)
    get '/consoles' do 
        if logged_in?
            @user = current_user 
            # @consoles= Console.where(user_id: session[:user_id])
            @consoles = @user.consoles
            erb :"consoles/index"
        else
             redirect "/login"
        end
    end

    #newpage(new consoles)
    get '/consoles/new' do 
        erb :"consoles/new"
    end 

    #show page (display one console)
    get '/consoles/:id' do 

        @console = Console.find_by(id:params[:id])

        if @console
            erb :"session/owns"
        else 
            redirect '/consoles'
        end 
    end 

    # edit
    get '/consoles/:id/edit' do
        @console = Console.find_by(id:params[:id])
        erb :"consoles/edit"
    end

    patch '/consoles/:id' do
        @console = Console.find_by(id:params[:id])

        if @console.update(params[:console])
            redirect "/consoles/#{@console.id}"
        else
            redirect "/consoles/#{@console.id}/edit" 
        end 
    end 

    #create route
    post '/consoles' do 
        @console = Console.new(params)
        if @console.save
            redirect "/consoles/#{@console.id}"
        else 
            redirect "/consoles/new"
        end 
    end

    # delete
    delete '/consoles/:id' do
        console = Console.find_by(id:params[:id])
        if console.destroy
            redirect "/consoles"
        else
            redirect "/consoles/#{console.id}"
        end 
    end

end