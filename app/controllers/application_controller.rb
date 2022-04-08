class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        else
          @current_user = nil
        end
      end

    private

    def not_found
        raise ActionController::RoutingError.new('404 Not Found')
    end

    def logged_in?
        redirect_to login_path if current_user.nil?
    end

    def sessioned?
      redirect_back(fallback_location: landing_path) if current_user
    end

    def is_admin?
        not_found unless current_user.admin?
    end
    
end
