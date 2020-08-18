class SessionsController < ApplicationController
  skip_before_action :authorize

  def new; end

  def landing
    @projects = Project.latest_projects
  end

  def new_lead
    VisitorMailer.with(name: params[:name], email: params[:email], message: params[:message]).new_lead_email.deliver_later
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_path(user.id)
    else
      redirect_to login_url, alert: 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
