class UserMailer < ApplicationMailer
    def password_reset(user)
        @user = user
        mail to: @user.email, subject: "Password reset"
#         from_email = ENV["GMAIL_ACCOUNT"]
#         password = ENV["GMAIL_PASSWORD"]
#         authentication = "plain"
#         to_email = @user.email

#         smtp = Net::SMTP.new 'smtp.gmail.com', 587
#         smtp.enable_starttls
#         message = <<END_OF_MESSAGE
# From: SomeName <my-email-id@gmail.com>
# To: ToName <receivers-email@gmail.com>
# Subject: Mail From Ruby 

# Hello there!!
# This is a message from Ruby.
# END_OF_MESSAGE

#         smtp.start("received-from-goes-here", from_email, password, :plain)
#         smtp.send_message(message, from_email, to_email)
#         smtp.finish()
    
    end
end

