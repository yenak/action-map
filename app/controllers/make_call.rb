require("bundler")
Bundler.require

account_sid = ENV["TWLIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.calls.create(
    to: ENV["MY_PHONE_NUMBER"],
    from: "+1215234175",
    url: "http://demo.twilio.com/docs/voice.xml"
)