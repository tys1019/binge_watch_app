# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Show.destroy_all

breaking = Show.create!(name: 'Breaking Bad', artwork: 'www.pics.com')
wire = Show.create!(name: 'The Wire', artwork: 'www.pics.com')
firefly = Show.create!(name: 'Firefly', artwork: 'www.pics.com')

1.upto(5) do |i|
   breaking.seasons << Season.create!(number: i)
   breaking.seasons.find(i).episodes << Episode.create!(number: i, length: 42)
end
