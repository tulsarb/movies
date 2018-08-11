# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :favorite_movie, MovieType, null: true do
      description 'Send a email to the current user about the movie'
      argument :id, ID, required: true
    end

    ## TODO: This won't work until auth is allowed for the api
    def favorite_movie(id:)
      return nil unless context[:current_user] && (movie = Movie.find(id))

      MovieMailer.favorite_email(current_user, movie).deliver_later
      RecursiveOpenStruct.new(movie)
    end
  end
end
