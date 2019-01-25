require 'bundler'
Bundler.require()

    account_sid = "AC4b1bbe2153f73f6b52b2436447966515"
    auth_token = "80342d8ded4ce6d097f2041c99cc12a1"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      to: ENV['NUMBER'],
      from: "+447480790688",
      body: ENV['PASS']
    )

  #class end
