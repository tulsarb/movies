class Movie
  def self.search(options = {})
    options.fetch(:query)
    MovieApi.new.search(options)
  end

  def self.popular(options = {})
    MovieApi.new.popular(options)
  end

  def self.find(id)
    movie = MovieApi.new.find(id)

    if movie['status_code'] != 34
      movie
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
