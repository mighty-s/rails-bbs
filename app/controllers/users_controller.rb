class UsersController < ApplicationController
    def new
        
    end
    
    def create
        @user = User.create(
        email: params[:email],
        password: params[:password],
        name: params[:name]
        )
        
        redirect_to '/'
    end
end
