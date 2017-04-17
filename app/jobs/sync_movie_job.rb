class SyncMovieJob < ApplicationJob
  queue_as :default

  def perform
    Movie.sync
  end
end
