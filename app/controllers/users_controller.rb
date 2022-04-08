class UsersController < ApplicationController

    before_action :logged_in?, only: %i[
        index
        show
        edit
        update
        destory
    ]
    before_action :sessioned?, only: %i[
        new
        create
    ]

    before_action :correct_user?, only: %i[
        show
        edit
        update
        destory
    ]

    before_action :is_admin?, only: %i[
        destory
    ]

    def show
    end
  
    def index
        @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            flash[:success] = "Successfully created an account"
            redirect_to "/users"
        else
            flash[:error] = "Error while creating an account, Please try again"
            redirect_to new_user_path
        end
    end
  
    private 
    
    def user_params
        params.require(:user).permit(
          :email,
          :first_name,
          :last_name,
          :password,
          :password_confirmation
        )
    end

    def correct_user?
        redirect_to landing_path unless current_user = User.find(params[:id])
    end

end