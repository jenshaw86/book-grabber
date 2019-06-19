class ApplicationController < ActionController::Base
    def logged_in
        if !session[:user_id]
            redirect_to login_path
        end
    end
end
