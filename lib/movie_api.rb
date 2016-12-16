class MovieApi
  def initialize
    url = 'https://api.themoviedb.org/3/'

    @conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.params[:api_key] = ENV.fetch('MOVIEDB_API_KEY')
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def popular(options = {})
    page = options.fetch(:page, 1)

    response = @conn.get do |req|
      req.url 'movie/popular'
      req.params[:page] = page
    end

    parse_results(response.body)
  end

  def search(options = {})
    query = options.fetch(:query)
    page = options.fetch(:page, 1)

    response = @conn.get do |req|
      req.url 'search/movie'
      req.params[:query] = query
      req.params[:page] = page
    end

    parse_results(response.body)
  end

  def find(id)
    response = @conn.get do |req|
      req.url "movie/#{id}"
    end
    JSON.parse(response.body)
  end

  private

  def parse_results(results)
    results = JSON.parse(results)

    {
      movies: results['results'],
      page: results['page'],
      total_pages: results['total_pages']
    }
  end
end

