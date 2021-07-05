require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Title",
      :genre => "Genre",
      :description => "Description",
      :author => "Author",
      :release_date => "Release date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Release date/)
  end
end