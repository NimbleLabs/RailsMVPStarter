class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    bootstrap_mail(to: @user.email, subject: 'Welcome to Rails MVP Starter... WHOHOO!')
  end

  def lead_email
    @lead = params[:lead]
    bootstrap_mail(to: @lead.email, subject: 'Welcome to Rails MVP Starter... WHOHOO!')
  end

end
