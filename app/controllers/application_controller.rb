class ApplicationController < ActionController::Base
    helper_method :current_user, :logges_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end 

    def require_login
        unless logged_in?
            redirect_to signin_path, alert: 'Logged in before continuing'
        end
    end
end
