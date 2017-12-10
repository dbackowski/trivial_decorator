# TrivialDecorator [![Build Status](https://travis-ci.org/dbackowski/trivial_decorator.svg?branch=master)](https://travis-ci.org/dbackowski/trivial_decorator)

A simple decorator for Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trivial_decorator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trivial_decorator

## Usage

#### Writing Decorators

Decorators inherit from TrivialDecorator::Base, live in your app/decorators directory, and are named for the model that they decorate:

```ruby
# app/decorators/user_decorator.rb

class UserDecorator < TrivialDecorator::Base
  def full_name
    first_name + " " + last_name
  end
end
```

#### Accessing helpers

```ruby
# app/decorators/user_decorator.rb

class UserDecorator < TrivialDecorator::Base
  def full_name
    h.content_tag(:strong, first_name + " " + last_name)
  end
end
```

#### Decorating Objects

```ruby
# app/controllers/users_controller.rb

class UsersController < ApplicationController
  def index
    @users = decorate(User.all)
  end
end
```

This will use UserDecorator, if you want to use other decorator, just pass his class name as second param to decorate.

```ruby
# app/controllers/users_controller.rb

class UsersController < ApplicationController
  def index
    @users = decorate(User.all, OtherDecorator)
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dbackowski/trivial_decorator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TrivialDecorator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dbackowski/trivial_decorator/blob/master/CODE_OF_CONDUCT.md).
