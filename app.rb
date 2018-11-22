require 'sinatra/base'
require_relative './lib/bookmarks'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/bookmarks' do
    @bookmarks = Bookmark.list
    erb(:bookmarks)
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  post '/bookmarks/new' do
    p params
    Bookmark.new(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
  @bookmark = Bookmark.find(id: params[:id])
  erb(:"bookmarks/update")
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
     redirect '/bookmarks'
   end

  run! if app_file == $0
end
