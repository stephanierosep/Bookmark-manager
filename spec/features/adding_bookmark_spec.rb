feature "Add a new bookmark" do
  scenario "User adds a bookmark to the list and views it" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks')
    fill_in 'url', with: 'https://facebook.com'
    click_button 'Add'

    expect(page).to have_content("https://facebook.com")

  end
end
