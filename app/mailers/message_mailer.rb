# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact.subject
  #
  def contact(message)
    @greeting = "Masz nową wiadomość od #{message.name}, wysłaną za pomocą strony bezpieczna-przystan"
    @message = message.body
    @email = message.email
    @phone_number = message.phone_number

    mail to: [Rails.application.credentials[:email], 'bezpieczna.przystan.prod@gmail.com']
  end
end
