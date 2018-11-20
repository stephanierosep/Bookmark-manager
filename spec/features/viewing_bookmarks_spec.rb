# require 'app.rb'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/bookmarks')
    expect(page).to have_text "Bookmark Manager"
  end
end
