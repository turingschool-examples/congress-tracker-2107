class Admin::BaseController < ApplicationController
    before_action :require_admin

    def require_admin
        if !current_admin?
            flash[:warning] = "You do not have access to this page."
            redirect_to root_path 
        end
    end 
end 