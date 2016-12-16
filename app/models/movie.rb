class Movie
  include ActiveModel::Model

  def self.search(options = {})
    options.fetch(:query, errors.add(:query, 'Search Params Required'))
    MovieApi.new.search(options)['results']
  end

  def self.popular(options = {})
    MovieApi.new.popular(options)['results']
  end
end