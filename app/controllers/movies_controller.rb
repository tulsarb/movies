class MoviesController < ApplicationController

  def index
    results = if params[:query].present?
                Movie.search(search_params)
              else
                Movie.popular(search_params)
              end

    @movies = results[:movies]
    @query = params[:query]
    @page = results[:page] ? results[:page] : 1
    @total_pages = results[:total_pages]
  end

  def show
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'record_not_found'
  end

  def record_not_found
    render 'record_not_found' # Assuming you have a template named 'record_not_found'
  end

  private

  def search_params
    if params[:page] && params[:page].to_i > 0
      params.permit(:query, :page)
    else
      params.permit(:query)
    end
  end
end
