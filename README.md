### VScale API v1 (WIP)

[![Coverage Status](https://coveralls.io/repos/Smolget/vscale-api/badge.svg?branch=master&service=github)](https://coveralls.io/github/Smolget/vscale-api?branch=master)
[![Build Status](https://travis-ci.org/Smolget/vscale-api.svg?branch=master)](https://travis-ci.org/Smolget/vscale-api)
[![Gem Version](https://badge.fury.io/rb/vscale-api.svg)](https://badge.fury.io/rb/vscale-api)
![](http://ruby-gem-downloads-badge.herokuapp.com/vscale-api?type=total)  

## Vscale API v1  

## Installation  
```ruby
  gem install vscale-api
```

## Basic Usage

```ruby

require 'vscale/api'

api = Vscale::Api::Client.new(ENV['VSCALE_TOPSECRET_TOKEN'])

# Images
api.images

```

## Contribution  

01. Fork  
02. Change  
03. PR  

## TODO
* [ ] Refactoring
* [ ] Usage examples
* [ ] Tests

*WIP*
