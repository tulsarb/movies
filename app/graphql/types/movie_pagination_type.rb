module Types
  class MoviePaginationType < Types::BaseObject
    field :movies, [MovieType], null: false
    field :page, Int, null: false
    field :total_pages, Int, null: false
  end
end