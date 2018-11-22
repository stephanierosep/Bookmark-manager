require 'bookmarks'
require 'database_helpers'




describe Bookmark do
  describe '.list' do
    it 'should display a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'https://www.amazon.co.uk', title: "Amazon")
      Bookmark.create(url: 'https://www.google.co.uk', title: "Google")
      Bookmark.create(url: 'https://www.github.com', title: "Github")

      bookmarks = Bookmark.list

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Amazon'
      expect(bookmarks.first.url).to eq 'https://www.amazon.co.uk'
    end
  end


  describe '.create' do
    it 'creates a new bookmark in the database' do

      bookmark = Bookmark.create(url: 'https://www.askjeeves.com', title: "AskJeeves")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data["id"]
      expect(bookmark.title).to eq 'AskJeeves'
      expect(bookmark.url).to eq 'https://www.askjeeves.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the list' do
      result = Bookmark.create(url: 'https://www.askjeeves.com', title: "AskJeeves")
      Bookmark.delete(id)
      expect(Bookmark.list).not_to include(result)
    end
  end
end
