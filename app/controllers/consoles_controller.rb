class ConsolesController < ApplicationController
    # Index Route (display all)
    get '/consoles' do 
        if logged_in?
            @user = current_user 
            @consoles = @user.consoles
            erb :"consoles/index"
        else
             redirect "/login"
        end
    end

    #newpage(new consoles)
    get '/consoles/new' do 
        # Checking if they are logged in
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
        # @console = Console.new(params)
        # @console.save
        user = current_user
        # if user == current_user
            @console = Console.create(:name => params[:name], :description => params[:description], :release_date => params[:release_date], :user_id => user.id)
            redirect "/consoles/#{@console.id}"
        # else 
        #     redirect "/consoles/new"
        # end 
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