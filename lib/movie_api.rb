class MovieApi
  def initialize
    url = 'https://api.themoviedb.org/3/'

    @conn = Faraday.new(:url => url) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    end
  end

  def popular(options = {})
    page = options.fetch(:page, 1)

    response = @conn.get do |req|
      req.url 'movie/popular'
      req.params[:api_key] = api_key
      req.params[:page] = page
    end

    JSON.parse(response.body)
  end

  def search(options = {})
    query = options.fetch(:query)
    page = options.fetch(:page, 1)

    response = @conn.get do |req|
      req.url 'search/movie'
      req.params[:query] = query
      req.params[:api_key] = api_key
      req.params[:page] = page
    end

    JSON.parse(response.body)
  end

  private

  def api_key
    @api_key ||= ENV.fetch('MOVIEDB_API_KEY')
  end
end

