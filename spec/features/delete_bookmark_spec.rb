feature 'delete a bookmarks' do
  scenario 'adds a bookmark and then removes it' do
    visit('/bookmarks')
    fill_in 'url', with: 'http://hello.com'
    fill_in 'title', with: 'cat'
    click_button 'Add'
    first('.bookmark').click_button 'Delete'
    expect(page).to have_content 'Bookmark Manager'
    expect(page).not_to have_content('cat')
  end
end
