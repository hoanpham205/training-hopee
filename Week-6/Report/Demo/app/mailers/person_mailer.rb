class PersonMailer < ApplicationMailer
  def welcome_email(person)
    @person = person
    mail(to: person.email, subject: 'Welcome to the site!')
  end
end
