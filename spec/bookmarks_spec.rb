require 'bookmarks'

describe Bookmarks do
  describe '.list' do
    it 'should display a list of bookmarks' do
      bookmarks = Bookmarks.list
      expect(bookmarks).to include("https://www.amazon.co.uk")
      expect(bookmarks).to include("https://www.google.co.uk")
      expect(bookmarks).to include("https://www.bbc.co.uk/news")
      expect(bookmarks).to include("https://www.github.com")
    end
  end
end
