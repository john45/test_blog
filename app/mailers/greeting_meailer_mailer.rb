class GreetingMeailerMailer < ApplicationMailer
  default from: 'john45@mail.ru'


  def after_registration(user)
    @user = user
    @counts_posts = @user.posts.count

    mail to: @user.email, subject: 'test message'


  end
end
