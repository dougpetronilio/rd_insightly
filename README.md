[ ![Codeship Status for dougpetronilio/rd_insightly](https://codeship.com/projects/d36b91a0-fcc3-0132-8760-5a06a30fe976/status?branch=master)](https://codeship.com/projects/87584)
[![Code Climate](https://codeclimate.com/github/dougpetronilio/rd_insightly/badges/gpa.svg)](https://codeclimate.com/github/dougpetronilio/rd_insightly)
[![Coverage Status](https://coveralls.io/repos/dougpetronilio/rd_insightly/badge.svg)](https://coveralls.io/r/dougpetronilio/rd_insightly)
# RdInsightly

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rd_insightly`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rd_insightly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rd_insightly

## Usage

Need create a authorization, you can use the method:

  Rdinsightly.create_authorization API_KEY

With authorization created you can start use the features:

To create a lead(*last_name required):

```ruby
  HASH_ATTRIBUTES = {name: '', email: '', company: '', phone: '', job_title: '', website: ''}
  RdInsightly::Lead.create last_name, HASH_ATTRIBUTES
```

To find a lead:

```ruby
  lead = RdInsightly::Lead.find ID
```

To update a lead:
  
```ruby
  lead = RdInsightly::Lead.find ID
  lead.update HASH_ATTRIBUTES
```

To delete a lead:

```ruby
  lead = RdInsightly::Lead.find ID
  lead.delete
```

To logout: 

```ruby
  RdInsightly.logout
```

Use method token= to controll with session[:token]

```ruby
  auth = RdInsightly.create_authorization API_KEY
  session[:token] = auth.api_token
```

Before_action authentication:

```ruby
  def authentication
    redirect_to '' if session[:token].nil?
    RdInsightly.token = session[:token] 
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rd_insightly.

