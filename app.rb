require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  def initialize
  end
  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $0
end
