# Streamlog

Streamlog is a Rails Mountable Engine. It streams rails application log to the browser. It is an alternative to [Browserlog](https://coveralls.io/r/dieb/browserlog).
Browserlog is based on polling while streamlog streams the log.

## Installation

Simply add it to your `Gemfile`

```ruby
gem 'streamlog'
```

And then mount this rails engine on `config/routes.rb`

```ruby
Rails.application.routes.draw do  
  mount Streamlog::Engine => '/streamlog'  
end
```

This will make the log available at ``domain/streamlog``. Make sure to authenticate this route.

### Using your app layout

Create ``streamlog.rb`` in ``config/initializers``, and add the following line in it.

```ruby
Streamlog.engine_layout = false
```

Then add the following lines in your application layout ``head`` tag

```ruby
<% yield :title %>
<% yield :head %>
```

This way, streamlog will use your application layout while rendering streamlog view.

## Note

You will need to install passenger with nginx/apache on your local machine to achieve concurrency and be able to test streamlog.
[GoRails](https://gorails.com/deploy/ubuntu/14.04) is a guide to setup Passenger with nginx.

## Supported Rails Version

* Rails >= 4.0
