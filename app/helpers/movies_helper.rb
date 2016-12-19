module MoviesHelper
  def poster_link(poster_path)
    if poster_path
      "https://image.tmdb.org/t/p/w500/#{poster_path}"
    else
      'http://www.popcorn.asia/assets/app/images/placeholder-movieimage.png'
    end
  end
end