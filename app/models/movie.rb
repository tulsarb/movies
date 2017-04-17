class Movie < ActiveRecord::Base
  def self.search(options = {})
    options.fetch(:query)
    MovieApi.new.search(options)
  end

  def self.popular(options = {})
    MovieApi.new.popular(options)
  end

  def self.find(id)
    movie = MovieApi.new.find(id)

    raise ActiveRecord::RecordNotFound unless movie['status_code'] != 34

    movie
  end

  def self.sync_job
    SyncMovieJob.perform_later
  end

  def self.sync
    results = self.popular

    results[:movies].each do |movie|
      movie = Movie.find_or_initialize_by(id: movie['id'])
      movie.title = movie['title']
      movie.description = movie['overview']
      movie.small_image = movie['poster_path']
      movie.large_image = movie['backdrop_path']
      movie.rating = movie['vote_average']

      movie.save
    end
  end
end
