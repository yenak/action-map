[![Maintainability](https://api.codeclimate.com/v1/badges/e85e1af25605c0458b59/maintainability)](https://codeclimate.com/github/yenak/action-map/maintainability)

[![Test Coverage](https://api.codeclimate.com/v1/badges/e85e1af25605c0458b59/test_coverage)](https://codeclimate.com/github/yenak/action-map/test_coverage)

[![Build Status](https://travis-ci.org/yenak/action-map.svg?branch=master)](https://travis-ci.org/yenak/action-map)

Link to app on Heroku: https://action-map.herokuapp.com/

Link to Pivotal Tracker Project: https://www.pivotaltracker.com/n/projects/2119805


# Brief Overview
ActionMap seeks to provide an integrated, seamless, and shareable platform that makes it easier for voters to connect with the progressive community while at the same time enabling progressive organizations, candidates, and elected leaders to reach new activists. The idea behind the application is to allow the user to visualize the political environment within all levels of government while also providing a platform to contact and voice their opinions to the decision makers within politics.

# Setup

In order to setup the app on your local environment, you will need to first fork clone
this repository onto your local system. Then, remove the application.yml.enc file
from the **/config** folder, as this is what we used before. Instead, you will need
to create your own **application.yml** file. Inside should be the following content:

```
development:
  secret_key_base: 0bd9ab8c98f191b3cba770f67e4424e9c5a57f8f1b5d036e10c3abf436d0f7ee71412744c29c862f513a1926663ee75199ffe02e8e2d89d518496e0179fb82ae

test:
  secret_key_base: 47a1fd7973cf01ab1766f7ca8294ee699bc1f79b59b808930b1fe6b0e244eaac82c1f28df8d9236017cd364e7e1cfda2f45e1a1fe94e3e1236231cdabb1c35cb

google_client_id: xxxxxxxxxxx.apps.googleusercontent.com
google_client_secret: xxxxxxxxxxx
```

You should replace the `xxxxxxx`'s with your own google omniauth API keys which you can
get from google developers console. This is needed in order to log in and verify users,
as the current login uses only Google logins.

Once you add this file to the **/config** folder, you will not have to worry about
accidentally pushing it since it has been already added to the **.gitignore** file.
However, you will need to encrypt this file (we used gpg) and push the encrypted file
to the repository, so that other team members can decrypt the file.

Finally, run the following commands in the root directory to set the rest of the project up.
```
bundle install --without production
bundle exec rake db:migrate
bundle exec rake db:seed
```
Afterward, we recommend that you add your own code climate badges and travisCI.
You will also need to make sure that your travisCI has the decryption key for
application.yml file in order for it to run properly. If you plan
to use heroku, you will make sure that you set an environment variable
containing the secret decryption key as well so that it can get the application.yml file. Once you have the
application.yml file, the figaro gem will automatically put the keys in its environment,
so if you need to access the google_client_id key inside another file, you can simply use
`<%= Figaro.env.google_client_id %>`.