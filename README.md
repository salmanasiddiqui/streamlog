# Streamlog

Streamlog is a Rails Mountable Engine. It streams application logs to the browser. It is an alternative to [Browserlog](https://coveralls.io/r/dieb/browserlog).
Browserlog is based on polling while streamlog streams the log.

## Installation

Simply add it to your `Gemfile`

```ruby
gem 'streamlog'
```

And then mount this rails engine on `config/routes.rb`.

```ruby
Rails.application.routes.draw do  
  mount Streamlog::Engine => '/streamlog'  
end
```

This will make the log available at ``domain/streamlog``. Make sure to authenticate this route.

## Supported Rails Version

* Rails >= 4.1
