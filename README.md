# HashTree: Simple Demo application

Follow below instructions to setup the application

## Initial Steps to create this app

### Requirement
* Ruby 2.4.0
* Rails 5.1.6
* PostgreSQL

### Create a new Rails application

```bash
$>git clone git@github.com:lareb/hash_tree.git
```

### Bundle Install

```bash
bundle install
```

### Create the databases

```bash
rake db:create
rake db:migrate
```

## Launch the app

```bash
rails server
```
## API End points

Create a new Url
```bash
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d ' {"data": {"type":"urls", "attributes":{"url":"https://github.com/lareb/hash_tree"}}}' http://localhost:3000/api/v1/urls.json
```

Get all Urls
```bash
curl -i -H "Accept: application/vnd.api+json" "http://localhost:3000/api/v1/urls"
```
