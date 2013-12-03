먼저(/^Comedy 장르가 있습니다$/) do
  @comedy = Genre.create!(name: "Comedy")
end

만약(/^Comedy 장르에 Caddychark 라는 영화를 등록합니다$/) do
  visit movies_path
  click_link "Add Movie"
  fill_in "Title", with: "Caddychark"
  select "1980", from: "Release year"
  check "Comedy"
  click_button "Save"
end

그러면(/^Caddychark 는 Comedy 장르여야 합니다$/) do
  visit movies_path
  click_link "Comedy"
  expect(page).to contain("1 movies")
  expect(page).to contain("Caddychark")
end
