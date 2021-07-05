# Project Descrption
I based this project on books and focused particularly on database data containing title, genre, and release date headings.
This project contains simple CRUD functionality such as create, read, update and delete functionalities as well as an additional
feature that allows users to find books by the same author. Users can filter books by genre, sort books by release date and by
title. Once users have read a book they can also write a brief description of that specific book of what the book was about and
their opinion on it. Sessions are incorporated into this project to save previous data displayed by users. 

Cucumber BDD acceptance tests are used to test the additional feature(find books by the same author). I developed three happy paths
for testing "adding an author to an existing book", "finding a book with the same author", and "adding an author to a new book".
One sad path was included to test when an author is unknown. I also increased the Cucumber code coverage by testing the filtering
and sorting of books features.

Rspec tests are included to test controller and model methods as well as CRUD functionality and GET requests to
certain pages i.e. GET index, show, new, edit.

# Overview of main features
- CRUD functionality
- Find books of same author
- Add a short description of a book feature
- Filter books by genre
- Sort books by release date(oldest to newest books)
- Sort books by title(alphabetical order)
- Ruby sessions
- Cucumber testing (3 happy paths, 1 sad path)
- Rspec testing of additional feature, routes, controller and model methods
