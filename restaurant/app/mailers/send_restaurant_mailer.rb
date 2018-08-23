class SendRestaurantMailer < ApplicationMailer
	def restaurant
	    @user_mail = params[:user]
	    mail(to: @user_mail, subject: 'your restaurant')
  end
end
