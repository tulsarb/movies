# frozen_string_literal: true

module Types
  class MoviePaginationType < Types::BaseObject
    field :movies, [MovieType], null: false
    field :page, Int, null: true
    field :total_pages, Int, null: true

    def movies
      object.movies || []
    end
  end
end
