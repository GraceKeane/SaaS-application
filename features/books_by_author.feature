Feature: search for books by author

  As a book buff
  So that I can find books with my favorite author
  I want to include and search on author information in books I enter

Background: books in database

  Given the following books exist:
  | title            | genre      | author    | release_date |
  | Gone Girl        | Thriller   |           | 2021-05-24   |
  | Harry Potter     | Fiction    | Grace     | 1997-06-26   |
  | Normal People    | Romance    | Jones     | 2018-08-28   |
  | The Great Gatsby | Tragedy    | Jones     | 1925-04-10   |
  | Austerlitz       | Historical | Thomas    | 2001-06-06   |
  
Scenario: add author to existing book
  When I go to the edit page for "Gone Girl"
  And  I fill in "Author" with "Ciara"
  And  I press "Update Book Info"
  Then the author of "Gone Girl" should be "Ciara"

Scenario: find book with same author
  Given I am on the details page for "Normal People"
  When  I follow "Find Books With Same Author"
  Then  I should be on the Similar Books page for "Normal People"
  And   I should see "The Great Gatsby"
  But   I should not see "Harry Potter"
  
Scenario: add author to new book
  Given I am on the home page
  Then  I go to the new book page
  When  I fill in "Title" with "Time"
  Then  I fill in "Author" with "Jack"
  And   I press "Save Book"

Scenario: can't find similar books if we don't know author (sad path)
  Given I am on the details page for "Gone Girl"
  Then  I should not see "Jones"
  When  I follow "Find Books With Same Author"
  Then  I should be on the home page
  And   I should see "'Gone Girl' has no director info"
 

  
