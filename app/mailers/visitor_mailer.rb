class VisitorMailer < ApplicationMailer
  default from: 'srba87@gmail.com'

  def new_lead_email
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    mail(to: 'srba87@gmail.com', subject: 'New lead on portfolio')
  end
end
