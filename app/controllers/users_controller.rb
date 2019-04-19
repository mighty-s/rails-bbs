class UsersController < ApplicationController
    def new
        
    end

    def create
        begin
            @user = User.create(
                email: params[:email],
                password: params[:password],
                name: params[:name]
            )
        rescue

        end
        redirect_to '/'
    end
end
