class SubscriptionMailer < ApplicationMailer
    
    def sample_email(user)
        @user = user
        mail(to: @user.email, subject: 'Sample Email')
    end
    def send_confirmation(user)
        @user = user
        mail(to: @user.email, subject: 'Subscription Confirmed')
    end
end
