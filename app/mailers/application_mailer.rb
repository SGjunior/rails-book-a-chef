class ApplicationMailer < ActionMailer::Base
  default from: 'sim.guertin@gmail.com' # Defaut value of the sender value for outgoing emails.



  layout 'mailer'
end
