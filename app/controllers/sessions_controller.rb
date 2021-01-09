class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:username], password: params[:password])
        if @user
            session[:user_id] = @user.id
            # flash[:notice] = 'Login sucessfully...'
            # redirect_to root_path
            # render users_path
            render json: {
                status: 'ok',
                msg: {
                    redirect_to: users_path
                }
            }
        
        else
            # flash[:notice] = 'Incorrect username or password'
            # render action: :new
            render json: {
                status: 'error',
                msg: 'error password'
            }
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Logout successfully...'
        redirect_to root_path
    end
end