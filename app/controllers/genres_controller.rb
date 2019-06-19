class GenresController < ApplicationController
    before_action :logged_in
    
    def show
        @genre = Genre.find(params[:id])
    end
end