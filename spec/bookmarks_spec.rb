require 'bookmarks'

describe Bookmark do
  describe '.list' do
    it 'should display a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.amazon.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.github.com');")

      bookmarks = Bookmark.list
      expect(bookmarks).to include("https://www.amazon.co.uk")
      expect(bookmarks).to include("https://www.google.co.uk")
      expect(bookmarks).to include("https://www.github.com")
    end
  end

  describe '.create' do
    it 'create a new bookmark in the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create(url: 'https://www.askjeeves.com')

      bookmarks = Bookmark.list

      expect(bookmarks).to include("https://www.askjeeves.com")
    end
  end
end
