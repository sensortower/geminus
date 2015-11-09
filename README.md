# Geminus

Simple way to share constants between backend/frontend.


## Installation

Add this line to your application's Gemfile:

    gem "geminus"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geminus

Inside of your Ruby program do:

    require "geminus"

...to pull it in as a dependency.


## Usage

Extend module with Geminus and define some properties:

``` ruby
require "geminus"

module Distribution
  include Geminus

  property :gentoo do
    property :name,     "Gentoo".freeze
    property :homepage, "https://www.gentoo.org/".freeze
  end

  property :debian do
    property :name,     "Debian".freeze
    property :homepage, "https://www.debian.org/".freeze
  end
end
```

Now you can use them inside your application on backend:

``` ruby
Distribution.gentoo.name # => "Gentoo"
```

Then you can create dynamically generated JavaScript:

``` ruby
// file: geminus.js.erb
<%= Geminus.generate %>
```

Sourcing that dynamically generated JS file on your frontend will provide you
now with `Distribution` module:

``` javascript
window.Distribution.gentoo.name // => "Gentoo"
```


## Contributing to Geminus

* Fork geminus on GitHub
* Make your changes
* Ensure all tests pass (`bundle exec rake`)
* Send a pull request
* If we like them we'll merge them
* If we've accepted a patch, feel free to ask for commit access!


## Copyright

Copyright (c) 2015 SensorTower Inc.
See LICENSE.txt for further details.
