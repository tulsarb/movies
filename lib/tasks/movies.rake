namespace :movies do
  desc 'Sync the most popular movies'
  task sync: :environment do
    SyncMovieJob.perform_later
  end
end

