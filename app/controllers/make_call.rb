# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = ENV['TWILIO_SID']
auth_token = ENV['TWILIO_KEY']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@call = @client.calls.create(
  url: 'http://demo.twilio.com/docs/voice.xml',
  to: '+19083476839',
  from: ENV['TWILIO_NUMBER']
)

puts @call.sid
