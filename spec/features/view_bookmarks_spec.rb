feature 'view bookmarks' do
  scenario 'can see a list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_text "https://www.amazon.co.uk"
  end
end
