feature 'update a bookmarks' do
  scenario 'adds a bookmark and then updates it' do
    visit('/bookmarks')
    fill_in 'url', with: 'http://hello.com'
    fill_in 'title', with: 'cat'
    click_button 'Add'
    first('.bookmark').click_button 'Update'
    fill_in 'url', with: 'http://hi.com'
    fill_in 'title', with: 'kelp'
    click_button 'Update'
    expect(page).to have_link('kelp', href: 'http://hi.com')
  end
end
