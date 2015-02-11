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



wire = Show.create!(name: 'The Wire', artwork: 'http://thetvdb.com/banners/_cache/posters/79126-13.jpg', description: 'This series looks at the narcotics scene in Baltimore through the eyes of law enforcers as well as the drug dealers and users. Other facets of the city that are explored in the series are the government and bureaucracy, schools and the news media. The show was created by former police reporter David Simon, who also wrote many of the episodes.')

firefly = Show.create!(name: 'Firefly', artwork: 'http://thetvdb.com/banners/_cache/posters/78874-2.jpg', description: 'Set 500 years in the future after a universal civil war, the crew of a small transport spaceship takes any job so long as it puts food on the table. The disparate men and women just want to survive and maybe have better lives, but they face constant challenges on the new frontier, such as the Reavers -- flesh-eating mongrels who live on the fringes of the universe.')

breaking = Show.create!(name: 'Breaking Bad', artwork: 'http://thetvdb.com/banners/_cache/posters/81189-10.jpg', description: "Mild-mannered high school chemistry teacher Walter White thinks his life can't get much worse. His salary barely makes ends meet, a situation not likely to improve once his pregnant wife gives birth, and their teenage son is battling cerebral palsy. But Walter is dumbstruck when he learns he has terminal cancer. Realizing that his illness probably will ruin his family financially, Walter makes a desperate bid to earn as much money as he can in the time he has left by turning an old RV into a meth lab on wheels.")

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

thrones = Show.create!(name: 'Game of Thrones', artwork: 'http://thetvdb.com/banners/posters/121361-4.jpg', description: "The best-selling book series 'A Song of Ice and Fire' is brought to the screen as HBO sinks its considerable storytelling teeth into the medieval fantasy epic. It's the depiction of two powerful families -- kings and queens, knights and renegades, liars and honest men -- playing a deadly game for control of the Seven Kingdoms of Westeros, and to sit atop the Iron Throne. ")

1.upto(4) do |i|
   thrones.seasons << Season.create!(number: i)
end

thrones.seasons.each do |season|
  1.upto(10) do |i|
     episode = Episode.create!(number: i, length: 60)
     season.episodes << episode
     thrones.episodes << episode
  end
end

orange = Show.create!(name: 'Orange is the New Black', artwork: 'http://thetvdb.com/banners/posters/264586-3.jpg', description: "Piper Chapman is a public relations executive with a career and a fiance when her past suddenly catches up to her. In her mid-30s she is sentenced to a year in a minimum-security women's prison in Connecticut for her association with a drug runner 10 years earlier. Forced to trade power suits for prison orange, Chapman makes her way through the corrections system and adjusts to life behind bars, making friends with the many eccentric, unusual and unexpected people she meets.")

1.upto(2) do |i|
   orange.seasons << Season.create!(number: i)
end

orange.seasons.each do |season|
  1.upto(10) do |i|
     episode = Episode.create!(number: i, length: 55)
     season.episodes << episode
     orange.episodes << episode
  end
end

sherlock = Show.create!(name: 'Sherlock', artwork: 'http://thetvdb.com/banners/posters/176941-4.jpg', description: "In this contemporary version of Sir Arthur Conan Doyle's detective stories, Dr. John Watson is a war vet just home from Afghanistan. He meets the brilliant but eccentric Holmes when the latter, who serves as a consultant to Scotland Yard, advertises for a flatmate. Almost as soon as Watson moves into the Baker Street flat, they are embroiled in mysteries, and Sherlock's nemesis, Moriarty, appears to have a hand in the crimes.")

1.upto(3) do |i|
   sherlock.seasons << Season.create!(number: i)
end

sherlock.seasons.each do |season|
  1.upto(3) do |i|
     episode = Episode.create!(number: i, length: 90)
     season.episodes << episode
     sherlock.episodes << episode
  end
end

twin = Show.create!(name: 'Twin Peaks', artwork: 'http://thetvdb.com/banners/posters/70533-3.jpg', description: "A crime drama mixed with healthy doses of the surreal, this series is about FBI Agent Dale Cooper, who travels to the small logging town of Twin Peaks to solve the murder of seemingly innocent high schooler Laura Palmer. Almost nothing is as it seems, however, and the show's sometimes eerie visuals, oddball characters and wild dream sequences drive the point home.")

1.upto(2) do |i|
   twin.seasons << Season.create!(number: i)
end

1.upto(8) do |i|
  episode = Episode.create!(number: i, length: 45)
  twin.seasons.first.episodes << episode
  twin.episodes << episode
end

1.upto(22) do |i|
  episode = Episode.create!(number: i, length: 45)
  twin.seasons.last.episodes << episode
  twin.episodes << episode
end

freaks = Show.create!(name: 'Freaks and Geeks', artwork: 'http://thetvdb.com/banners/posters/76321-3.jpg', description: "Growing up circa 1980, a misfit high-school student and his pals are probably destined to become new media millionaires, but right now they're stuck in school, where all the girls are a foot taller and bullies terrorize the gym class. Meanwhile, his older sister is flirting with the dope-smoking bad boys, cutting classes and questioning the point of getting good grades.
")

   freaks.seasons << Season.create!(number: 1)


1.upto(18) do |i|
   episode = Episode.create!(number: i, length: 44)
   freaks.seasons.first.episodes << episode
   freaks.episodes << episode
end

