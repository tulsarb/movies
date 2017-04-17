class MovieMailer < ApplicationMailer
  def favorite_email(email, url)
    @email = email
    @url  = url
    mail(to: email, subject: 'Favorite Movie')
  end
end
