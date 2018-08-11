# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :movies_list, MoviePaginationType, null: true do
      argument :query, String, required: false
      argument :page, Int, required: false
    end

    field :movie, MovieType, null: true do
      argument :id, ID, required: true
    end

    def movies_list(query: nil, page: 1)
      results = if query
                  Movie.search(query: query, page: page)
                else
                  Movie.popular(page: page)
                end
      RecursiveOpenStruct.new(results, recurse_over_arrays: true)
    end

    def movie(id:)
      movie = Movie.find(id)
      RecursiveOpenStruct.new(movie)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
