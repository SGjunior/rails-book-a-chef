class ApplicationMailer < ActionMailer::Base
  default from: 'martingiannademo@gmail.com' # Defaut value of the sender value for outgoing emails.



  layout 'mailer'
end
