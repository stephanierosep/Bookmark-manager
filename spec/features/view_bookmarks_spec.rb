require 'pg'

feature 'view bookmarks' do
  scenario 'can see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: 'https://www.amazon.co.uk', title: "Amazon")
    Bookmark.create(url: 'https://www.google.co.uk', title: "Google")
    Bookmark.create(url: 'https://www.github.com', title: "Github")

    visit '/bookmarks'

    expect(page).to have_link('Amazon', href:'https://www.amazon.co.uk')
    expect(page).to have_link('Google', href:'https://www.google.co.uk')
    expect(page).to have_link('Github', href:'https://www.github.com')

  end
end
