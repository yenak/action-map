from twilio.jwt.client import ClientCapabilityToken

account_sid = 'ACb5dd0fab4631494a9ad63f3bc04b0a58'
auth_token = 'c9fbb078b9edf3b6df1b7a02f6b2bad5'
application_sid = 'AP123123'

capability = ClientCapabilityToken(account_sid, auth_token, ttl=600)

print(capability)
