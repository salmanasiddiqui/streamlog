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

To use your the layout of your app, add the following line in your initializer

```ruby
Streamlog.engine_layout = false
```

And add the following line in your layout ``head`` tag

```ruby
<% yield :head %>
```


This will make the log available at ``domain/streamlog``. Make sure to authenticate this route.

## Supported Rails Version

* Rails >= 4.1
