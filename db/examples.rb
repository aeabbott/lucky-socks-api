# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end



  Race.create([
        {
          name: 'Half',
          distance: 13.1,
          time: 237128,
          race_day:'2017-02-02',
          location: 'Newton',
          user_id: 1
        },
        {
          name: 'Full',
          distance: 13.1,
          time: 237128,
          race_day:'2017-03-01',
          location: 'Newton',
          user_id: 1
        },
        {
          name: 'Half',
          distance: 13.1,
          time: 237128,
          race_day: '2017-08-10',
          location: 'Newton',
          user_id: 1
        },
    ])
