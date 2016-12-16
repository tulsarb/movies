class MoviesController < ApplicationController
  def index
    results = if params[:query].present?
                Movie.search(search_params)
              else
                Movie.popular(search_params)
              end

    @movies = results[:movies]
    @query = params[:query]
    @page = results[:page]
    @total_pages = results[:total_pages]
  end

  def show

  end

  private

  def search_params
    params.permit(:query, :page)
  end
end
