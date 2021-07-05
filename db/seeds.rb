# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = [{:title => 'Harry Potter', :genre => 'Fiction', :release_date => '26-Jun-1997'},
         {:title => 'To Kill a Mockingbird', :genre => 'Gothic fiction', :release_date => '11-Jul-1960'},
         {:title => 'The Great Gatsby', :genre => 'Tragedy', :release_date => '10-Apr-1925'},
         {:title => 'Invisible Man', :genre => 'Science Fiction', :release_date => '14-Apr-1952'},
         {:title => 'Gone Girl', :genre => 'Thriller', :release_date => '24-May-2021'},
         {:title => 'The Haunting of Hill House', :genre => 'Horror' , :release_date => '17-Jan-1959'},
         {:title => 'Normal People', :genre => 'Romance', :release_date => '28-Aug-2018'},
         {:title => 'Austerlitz', :genre => 'Historical', :release_date => '06-Jun-2001'},
        ]

books.each do |book|
    Book.create!(book)
end

