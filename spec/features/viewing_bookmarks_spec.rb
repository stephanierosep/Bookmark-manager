# require 'app.rb'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_text "Bookmark Manager"
  end
end
