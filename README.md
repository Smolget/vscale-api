## VScale API v1 (WIP)

[![Coverage Status](https://coveralls.io/repos/Smolget/vscale-api/badge.svg?branch=master&service=github)](https://coveralls.io/github/Smolget/vscale-api?branch=master)
[![Build Status](https://travis-ci.org/Smolget/vscale-api.svg?branch=master)](https://travis-ci.org/Smolget/vscale-api)
[![Gem Version](https://badge.fury.io/rb/vscale-api.svg)](https://badge.fury.io/rb/vscale-api)

## Installation  
```ruby
  gem install vscale-api
```

## Basic Usage
```ruby

require 'vscale-api'

api = Vscale::Api::Client.new(ENV['VSCALE_TOPSECRET_TOKEN'])

# Background
api.images
api.locations

# Servers
api.scalets
api.new_scalet
api.find_scalet(:id)
api.restart_scalet(:id)
api.stop_scalet(:id)
api.start_scalet(:id)
api.upgrade_scalet(:id, :params)
api.delete_scalet(id)
api.tasks
api.scalet_sshkeys(params)

# Account
api.account

# Billing
api.payments
api.consumption(params = {})
api.notify
api.update_notify(params = {})
api.balance

# Configurations
api.rplans
api.prices

# Tokens
api.tokens(params = {})
api.find_token(id)
api.update_token(id, params)
api.remove_token(id)

# Tickets
api.tickets
api.tickets_new(params)
api.ticket_comments
api.tickets_add_comment(params)
api.tickets_close(id)

# SSH Keys
api.sshkeys
api.sshkeys_new(params)
api.sshkeys_delete(id)


```

## Contribution  

01. Fork  
02. Change  
03. PR  

*WIP*
