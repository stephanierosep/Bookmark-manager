require 'sinatra/base'
require_relative './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.list
    erb(:bookmarks)
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
