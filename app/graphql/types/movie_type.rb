# frozen_string_literal: true

module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: true
    field :video, Boolean, null: true
    field :vote_average, Int, null: true
    field :title, String, null: true
    field :popularity, Float, null: true
    field :poster_path, String, null: true
    field :original_language, String, null: true
    field :original_title, String, null: true
    field :backdrop_path, String, null: true
    field :adult, Boolean, null: true
    field :overview, String, null: true
    field :release_date, String, null: true
    field :vote_count, Int, null: true
  end
end
