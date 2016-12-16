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
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'record_not_found'
  end

  def record_not_found
    render 'record_not_found' # Assuming you have a template named 'record_not_found'
  end

  private

  def search_params
    params.permit(:query, :page)
  end
end
