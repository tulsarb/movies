class MovieMailer < ApplicationMailer
  def favorite_email(user, movie)
    @user = user
    @movie  = movie
    mail to: @user.email, subject: "#{@movie['title']} Favorited"
  end
end
