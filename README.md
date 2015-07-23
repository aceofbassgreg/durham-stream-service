A simple microservice for accepting HTTP requests and interacting with a db (Postgres) via Activerecord.

To launch locally:

`
bundle install
rackup -s thin -p 4567
`

You can then add entries via cURL:

`
curl -H "Content-Type: application/json" -X POST -d '{"text_to_display":"foo","text_created_at":"2015-07-22","tags":"beer","md5":"1111113333445566","source": "cURL"}' localhost:4567/entries --ipv4
`

or by launching a console session:

`
bundle exec ./console
params = ENTRY_PARAMS    #see above JSON for example
e = Entry.new(params)  
e.save
`