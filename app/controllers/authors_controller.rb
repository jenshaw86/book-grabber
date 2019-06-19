class AuthorsController < ApplicationController
    before_action :logged_in
    
    def show
        @author = Author.find(params[:id])
    end
end