![GMIT Logo](http://password.gmit.ie/images/logo.png "GMIT Logos")
# Software Engineering Project 2021
### BSc (Hons) Computing in Software Development

## Introduction
The project will address the module learning outcomes by focusing on the following topics:
- Software as a Service / Cloud Computing 
- Web Application Architectures (MVC)
- Software Development Frameworks
- Database Management
- Requirements Specification/Automated Acceptance Testing using Behaviour-Driven Development
- Unit and Functional Testing
- Test Coverage Metrics

## Requirements
I was required to create and deploy a SaaS application using the Ruby on Rails framework, and write a comprenehsive suite of automated tests. In terms of functionality my application is relatively simple. The focus here is not on building a complex feature-heavy application, but rather on building a simple application using solid engineering principles with thorough automated tests. My application conforms to the specification detailed below.

### Specification 

#### Functionality
- Basic CRUD operations on a single resource.
- Basic filtering and sorting functionality
- includes at least one **additional feature** beyond the basic CRUD and filtering/sorting features. 
 
#### Database
- An SQL database in development and postgres in production.
- defined a database schema in a Rails migration, which can be used to create a database using the `rake db:migrate` task.
- defined seed data which can be used to populate the database with initial data using the `rake db:seed` task.

#### Testing
##### Cucumber
- Cucumber BDD/Acceptance tests which verify the **additional feature** works as expected. Each Scenario includes both the happy and sad paths of the feature.

##### RSpec
- RSpec unit/functional tests for the controller and model. My RSpec tests tests:
  - the controller and model logic added to implement the **additional feature**.
  - Page requests (GET, POST)
  - CRUD
 ##### Code Coverage
87%

### Heroku CLI Cheat Sheet
Collection of useful Heroku command-line interface commands used throughout development.

| Test | Command |
| --- | --- |
| Logging in to Heroku CLI | `heroku login -i`|
| Create new Heroku App | `heroku create` |
| Deploy latest code to Heroku | `git push heroku master`|
| Set up production DB schema on Heroku | `heroku run rake db:migrate`|
| Seed production DB schema on Heroky | `heroku run rake db:seed`|
