
class PagesController < ApplicationController
  
  def home

  end

  def blah 
  	#forms come to process, 
  	#call Reminder object and redirect to home
  	#display flash message
  	@phone = params[:phone_number]
  	@message = params[:phone_message]

  	#if @phone.length > 10
  	#	flash[:error] = "Try putting your number again"
  	#	render 'new'
  	#else
	  	account_sid = 'AC83e09d2c4fc1656094b5c263ce9c3546'
	  	auth_token = '813eb1301a3a7c5f7c36df6cd60500ac'

	  	@client = Twilio::REST::Client.new account_sid, auth_token
	  	@client.account.sms.messages.create(
	  	  :from => '+12403934192',
	  	  :to => @phone,
	  	  :body => @message
	  	)
	  	flash[:notice] = "You have successfully logged out."
	  	redirect_to pages_home_path
	 # end

  end
end