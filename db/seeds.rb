# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Show.destroy_all
List.destroy_all

List.create!

breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-mannered high school chemistry teacher Walter White thinks his life can't get much worse. His salary barely makes ends meet, a situation not likely to improve once his pregnant wife gives birth, and their teenage son is battling cerebral palsy. But Walter is dumbstruck when he learns he has terminal cancer. Realizing that his illness probably will ruin his family financially, Walter makes a desperate bid to earn as much money as he can in the time he has left by turning an old RV into a meth lab on wheels.")

wire = Show.create!(name: 'The Wire', artwork: 'http://thetvdb.com/banners/_cache/posters/79126-13.jpg', description: 'This series looks at the narcotics scene in Baltimore through the eyes of law enforcers as well as the drug dealers and users. Other facets of the city that are explored in the series are the government and bureaucracy, schools and the news media. The show was created by former police reporter David Simon, who also wrote many of the episodes.')

firefly = Show.create!(name: 'Firefly', artwork: 'http://thetvdb.com/banners/_cache/posters/78874-2.jpg', description: 'Set 500 years in the future after a universal civil war, the crew of a small transport spaceship takes any job so long as it puts food on the table. The disparate men and women just want to survive and maybe have better lives, but they face constant challenges on the new frontier, such as the Reavers -- flesh-eating mongrels who live on the fringes of the universe.')

1.upto(5) do |i|
   breaking.seasons << Season.create!(number: i)
end

breaking.seasons.each do |season|
  1.upto(12) do |i|
     episode = Episode.create!(number: i, length: 42)
     season.episodes << episode
     breaking.episodes << episode
  end
end

1.upto(1) do |i|
   firefly.seasons << Season.create!(number: i)
end

firefly.seasons.each do |season|
  1.upto(14) do |i|
     episode = Episode.create!(number: i, length: 42)
     season.episodes << episode
     firefly.episodes << episode
  end
end

1.upto(5) do |i|
   wire.seasons << Season.create!(number: i)
end

wire.seasons.each do |season|
  1.upto(12) do |i|
     episode = Episode.create!(number: i, length: 60)
     season.episodes << episode
     wire.episodes << episode
  end
end
