# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#json = ActiveSupport::JSON.decode(File.read('db/cities.json'))

#json.each do |a|
#  City.create!(airport: a)
#end

json = ActiveSupport::JSON.decode(File.read('db/airports.json'))

json.each do |a|
  #City.create!(name: a['name'], city: a['city'], country: a['country'], iata: a['iata'], icao: a['icao'], latitude: a['latitude'], longitude: a['longitude'], altitude: a['altitude'], timezone: a['timezone'], dst: a['dst'])
  #City.create!(name: a.name, city: a.city, country: a.country, iata: a.iata, icao: a.icao, latitude: a.latitude, 
  #longitude: a.longitude, altitude: a.altitude, timezone: a.timezone, dst: a.dst)
   Airport.create!(a.to_hash)
end


json = ActiveSupport::JSON.decode(File.read('db/airlines.json'))

json.each do |a|
  Airline.create!(iata: a['iata'], name: a['name'])
end