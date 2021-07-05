require 'spec_helper'

describe Book do
  describe 'show all genres - testing model' do
     it 'return all genres' do       
       expect(Book.all_genres).to match(["Fiction", "Gothic fiction", "Tragedy", "Science Fiction", "Thriller", "Horror", "Romance", "Historical"])
     end
    
    describe "similar books"
        it "finds books by the same author - testing model" do
            book1 = Book.create! author: 'Greg'
            book2 = Book.create! author: 'Greg'
            expect(book1.books_of_author).to include(book2)
        end
        
        it "do not find books by same author - testing model" do
            book1 = Book.create! author: 'Greg'
            book2 = Book.create! author: 'Anna'
            expect(book1.books_of_author).not_to include(book2)
        end
    end   
end 