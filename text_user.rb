require 'bundler'
Bundler.require()

    account_sid = Config.twilio_api_sid
    auth_token = Config.twilio_api_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      to: ENV['NUMBER'],
      from: "+447480790688",
      body: ENV['PASS']
    )

  #class end
