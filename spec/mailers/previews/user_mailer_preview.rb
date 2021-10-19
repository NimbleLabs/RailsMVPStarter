class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end

  def lead_email
    UserMailer.with(lead: Lead.last).lead_email
  end
end