Setup:
In your command line, run `export KEY=your-secret-key-value`

To encrypt config/application.yml:
`gpg --symmetric --batch --yes --passphrase "$KEY" --cipher-algo AES256 --output config/application.yml.enc config/application.yml`

To decrypt config/application.yml.enc:
`gpg --decrypt --batch --yes --passphrase "$KEY" --output config/application.yml config/application.yml.enc`