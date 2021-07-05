Given /the following books exist/ do |books_table|
  books_table.hashes.each do |book|
    Book.create book
  end
end

Then /(.*) seed books should exist/ do | n_seeds |
  Book.count.should be n_seeds.to_i
end

Then(/^the author of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  book = Book.find_by_title(arg1)
  expect(book.author).to eq arg2
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  expect(/[\s\S]*#{e1}[\s\S]*#{e2}/).to match(page.body)
end

When /I (un)?check the following genres: (.*)/ do |uncheck, genre_list|
  genre_list.split(',').each do |genre|
      step "I #{uncheck}check \"genres_#{genre.strip}\""
  end
end

Then /I should see all the books/ do
  page.should have_selector('tbody/tr', count:Book.count)
end
