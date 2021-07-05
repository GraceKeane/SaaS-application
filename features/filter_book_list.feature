Feature: display list of books filtered by genre rating
 
  As a concerned parent
  So that I can quickly browse books appropriate for my family
  I want to see books read only certain Fiction ratings

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

Scenario: restrict to books with 'Romance' or 'Horror' genres
  Given I check the following genres: Romance, Horror
  And I uncheck the following genres: Historical, Thriller, Fiction, Science Fiction, Tragedy, Gothic fiction
  When I press "Refresh" 
  Then I should see "Normal People"
  And I should not see "Gone Girl"

Scenario: all genres selected
  Given I check the following genres: Historical, Thriller, Fiction, Science Fiction, Tragedy, Gothic fiction, Romance, Horror
  When I press "Refresh"
  Then I should see all the books 
