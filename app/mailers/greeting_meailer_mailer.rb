class GreetingMeailerMailer < ApplicationMailer
  default from: 'john45@mail.ru'

  def welcome(email, name)
    @name = name
    mail to: email, subject: 'Welcome message'
  end
end
