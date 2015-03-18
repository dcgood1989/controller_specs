require "rails_helper"

feature "managing books" do
  scenario "can see a list of all books on the homepage" do
    create_book(title: "Harry Potter", author: "Some Muggle")
    visit root_path

    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Some Muggle"
  end

  scenario "can create books with titles and authors" do
    visit root_path

    click_on "New Book"

    fill_in "Title", with: "Harry Potter"
    fill_in "Author", with: "Some Muggle"

    click_on "Create Book"

    expect(page).to have_content "Harry Potter"
    expect(page).to have_content "Some Muggle"
  end
end
