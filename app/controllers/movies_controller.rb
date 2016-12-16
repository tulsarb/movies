class MoviesController < ApplicationController
  
  def index
    @movies = if params[:movie]
                Movie.search(search_params)
              else
                Movie.popular
              end
  end

  def show

  end

  private

  def search_params
    params.require(:movie).permit(:query, :page)
  end
end
