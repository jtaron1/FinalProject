# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Feed.delete_all
FeedsUser.delete_all

Feed.create!(feed_id: 1, url: 'http://rss.cnn.com/rss/cnn_topstories.rss', name: 'CNN')
Feed.create!(feed_id: 2, url: 'http://feeds.abcnews.com/abcnews/topstories', name: 'ABC News')
Feed.create!(feed_id: 3, url: 'http://feeds.washingtonpost.com/rss/homepage', name: 'Washington Post')

FeedsUser.create!(user_id: 2, feed_id: 1)
FeedsUser.create!(user_id: 2, feed_id: 2)
FeedsUser.create!(user_id: 2, feed_id: 3)
