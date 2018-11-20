require 'pg'

feature 'view bookmarks' do
  scenario 'can see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://www.amazon.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.google.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.github.com');")

    visit '/bookmarks'

    expect(page).to have_content "https://www.amazon.co.uk"
    expect(page).to have_content "https://www.google.co.uk"
    expect(page).to have_content "https://www.github.com"

  end
end
