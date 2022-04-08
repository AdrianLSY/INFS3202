class SessionsController < ApplicationController

    before_action :sessioned?, only: %i[
        new
        create
    ]

    before_action :logged_in?, only: %i[
        destory
    ]

    def new
    end

    def create
        session_params = params.permit(:email, :password)
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to "/"
        else
            flash[:notice] = "Login is invalid!"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = "You have been signed out!"
        redirect_to landing_path
    end

end
