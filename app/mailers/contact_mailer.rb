class ContactMailer < ActionMailer::Base
  default from: "contact-mailer@edg.co.in"

  def contact_mail(message)
    @name = message.name
    @email = message.email
    @message = message.message
    
    contact_category = message.contact_category
    contacts = [contact_category.contact1, contact_category.contact2]

    to_string = contacts.collect(&:email).join(',')
    subject = @name + ' submitted a contact form on edg.co.in'

    mail(from: @email, to: to_string, subject: subject)
  end
end
