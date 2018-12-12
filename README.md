# Book Club
This is a website storing Books & Authors, and has the ability for users to review specific books.

### Getting Started

Run Bundle 
```ruby
  bundle install
  bundle update
```
Install Rails 5.1
```ruby
  gem install rails -v 5.1
```

Clone this repo into your desired directory and cd into it.
  
Start Server and visit page
```ruby
  rails s
```

```
  open browser & visit localhost:3000
```

### Default Database Configuration

To edit the books that are present on load:
- open seed file & edit what's being created 
- then run the following line
```ruby
  rake db:{drop,create,migrate}
```

To start with a blank table
- Open seed file -> remove all files
- Then run the following snippet

```ruby
rake db:{drop,create,migrate,seed}
```

### Testing

To run tests after bundle

```ruby
rspec
```

