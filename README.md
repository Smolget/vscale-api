### VScale API v1 (WIP)

[![Coverage Status](https://coveralls.io/repos/github/Smolget/vscale-api/badge.svg?branch=feature%2Fcoveralls)](https://coveralls.io/github/Smolget/vscale-api?branch=feature%2Fcoveralls)
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
See [examples](https://github.com/Smolget/vscale-api/tree/master/examples)

## Contribution  

01. Fork  
02. Change  
03. PR  

## What you can improve
  - Add more examples
  - Improve or refactor any part of code 😋

## Thank for contribution
  - [noma4i](https://github.com/noma4i)  
  - [Shalmezad](https://github.com/Shalmezad)  

## Where used
  - [infra-vscale](https://github.com/d-theus/infra-vscale)

*WIP*
