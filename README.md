# ShiftPlanning

Ruby gem for the [Shift Planning API](http://www.shiftplanning.com)

## Status
[![Gem Version](https://badge.fury.io/rb/shift_planning.png)](http://badge.fury.io/rb/shift_planning)
[![Build Status](https://secure.travis-ci.org/tylermercier/shift_planning.png)](http://travis-ci.org/tylermercier/shift_planning)
[![Code Climate](https://codeclimate.com/github/tylermercier/shift_planning.png)](https://codeclimate.com/github/tylermercier/shift_planning)

## Installation

Add this line to your application's Gemfile:

    gem 'shift_planning'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shift_planning

## Usage

    ShiftPlanning.init({
      :username => 'username',
      :password => 'password',
      :key => 'api_key'
    })

    ShiftPlanning.skills

    ShiftPlanning.employees

    ShiftPlanning.employee(887992)

    ShiftPlanning.add_skill(887992, 50186)

    ShiftPlanning.remove_skill(887992, 50186)


## Contributing

1. Fork it ( http://github.com/<my-github-username>/ShiftPlanning/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
