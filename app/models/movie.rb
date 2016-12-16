class Movie
  include ActiveModel::Model

  def self.search(options = {})
    options.fetch(:query)
    MovieApi.new.search(options)['results']
  end

  def self.popular(options = {})
    MovieApi.new.popular(options)['results']
  end
end
