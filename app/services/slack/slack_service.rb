class Slack::SlackService
  SYSTEM_ALERT_URL = ENV['SLACK_URL']

  def initialize(slack_url)
    @slack_url = slack_url
  end

  def post(message)
    return unless Rails.env.production?
    HTTParty.post(@slack_url, body: {"text": message.to_s}.to_json)
  end

  def system_message(title, messages)
    message_body = "#{title}\n"
    messages.each do |message|
      message_body += "#{message}\n"
    end

    post(message_body)
  end

  class << self
    def system_alert_service
      Slack::SlackService.new(Slack::SlackService::SYSTEM_ALERT_URL)
    end
  end
end