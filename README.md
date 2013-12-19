# Simple validators

## Installation

Add this line to your application's Gemfile:

    gem 'simple-validators'

And then execute:

    $ bundle

## Model validations

To use model validations include `Simple::Validators` in your model.

```ruby
class User < ActiveRecord::Base
  include Simple::Validators

  attr_accessible :email, :username

  validates :email, presence: true, email: true
  validates :username, presence: true, username: true
end
```

#### Subdomain validator

```ruby
class Account < ActiveRecord::Base
  include Simple::Validators

  attr_accessible :subdomain

  validates :subdomain, presence: true, uniqueness: true, subdomain: true
end
```

You can also pass a custom list of reserved subdomains, eg:

```ruby
validates :subdomain, subdomain: { reserved: %w[www mail ftp home test] }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
