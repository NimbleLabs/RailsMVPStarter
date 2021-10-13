class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Rails MVP Starter... WHOHOO!')
  end

  def invitation_email
    @invitation = params[:invitation]
    @company = @invitation.company
    @url = "#{new_user_registration_url}?uuid=#{@invitation.uuid}"
    mail(to: @invitation.email, subject: "You're Invited!")
  end

end
