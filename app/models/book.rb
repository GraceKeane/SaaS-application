class Book < ActiveRecord::Base
    
    def books_of_author
        Book.where('author=?', self.author)
    end
    
    def self.all_genres
        # Genre list from DB
        ['Fiction', 'Gothic fiction', 'Tragedy', 'Science Fiction', 'Thriller', 'Horror', 'Romance', 'Historical']
    end
    
    # Add new feature => author
    def self.similar_books book_title
        author = Book.find_by(title: book_title).author
        return nil if author.blank? or author.nil?
        Book.where(author: author).pluck(:title)
    end
    
    def self.with_genres(genres_list)
        # Retrieve all genres
        if genre_list
            # Books with that genre
            Book.where(genre: genres_list)
        else
            # Return all books
            Book.all
        end
    end
end
