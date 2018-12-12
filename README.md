# Book Club
This is a website storing Books & Authors, and has the ability for users to review specific books.

### Getting Started

Run Bundle 
```bash
  bundle install
  bundle update
```
Install Rails 5.1
```ruby
  gem install rails -v 5.1
```

Clone this repo into your desired directory and cd into it.
  
Start Server and visit page
```bash
  rails s
```

```
  open browser & visit localhost:3000
```

### Default Database Configuration

To edit the books that are present on load:
- open seed file & edit what's being created 
- then run the following line
```bash
rake db:{drop,create,migrate,seed}
```

To start with a blank table, just run the following snippet
```bash
  rake db:{drop,create,migrate}
```


### Testing

To run tests after bundle

```ruby
rspec
```

