Feature: display list of books sorted by different criteria

  As an active bookgoer
  So that I can quickly browse books based on my preferences
  I want to see books sorted by title or release date

Background: books have been added to database

  Given the following books exist:
  | title                      | genre           | release_date |
  | Austerlitz                 | Historical      | 2001-06-06   |
  | Gone Girl                  | Thriller        | 2021-05-24   |
  | Harry Potter               | Fiction         | 1997-06-26   |
  | Invisible Man              | Science Fiction | 1952-04-14   |
  | Normal People              | Romance         | 2018-08-28   |
  | The Great Gatsby           | Tragedy         | 1925-04-10   |
  | The Haunting of Hill House | Horror          | 1959-01-17   |
  | To Kill a Mockingbird      | Gothic fiction  | 1960-07-11   |
  
  And  I am on the home page
  Then 8 seed books should exist
  
Scenario: sort books alphabetically
  When I follow "Book Title"
  Then I should see "Austerlitz" before "To Kill a Mockingbird" 

Scenario: sort books in increasing order of release date
  When I follow "Release Date"
  Then I should see "The Great Gatsby" before "Gone Girl"
