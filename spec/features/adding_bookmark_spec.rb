feature "Add a new bookmark" do
  scenario "User adds a bookmark to the list and views it" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks')
    fill_in 'url', with: 'https://www.askjeeves.com'
    fill_in 'title', with: 'AskJeeves'
    click_button 'Add'
    

    expect(page).to have_link( 'AskJeeves', href: 'https://www.askjeeves.com')
  end
end
