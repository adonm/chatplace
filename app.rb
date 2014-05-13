require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/channels.db")

class Channel
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :topic, Text
  property :created_at, DateTime
  property :location, Text
  property :subscribers, Text
  property :subscriber_count, PositiveInteger
end

DataMapper.finalize
# create the channels table
Channel.auto_upgrade!

# serve static files
set :public_folder, 'public'

get '/' do
  redirect '/index.html'
end

