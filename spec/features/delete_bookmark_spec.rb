feature 'delete a bookmarks' do
  scenario 'adds a bookmark and then removes it' do
    visit('/bookmarks')
    fill_in 'url', with: 'http://hello.com'
    fill_in 'title', with: 'title'
    click_button 'Add'
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_content('title')
  end
end
