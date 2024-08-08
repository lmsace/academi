@theme @theme_academi @_file_upload @javascript

Feature:Check jumbotron in theme_academi in the "Jumbotron" tab on the "Academi" theme settings page
  In order to use the features
  As a admin
  I need to manage theme settings in the system

  Background:
    Given the following "categories" exist:
        | name      | category | idnumber |
        | category2 |   0      | CAT1     |
        | category3 |   0      | CAT2     |
        | category4 |   0      | CAT3     |
        | category5 |   0      | CAT4     |
        | category6 |   0      | CAT5     |
    And the following "courses" exist:
        | fullname | shortname | category | courseid |
        | Course 1 | C1        | 0        |     1    |
        | Course 2 | C2        | CAT1     |     2    |
        | Course 3 | C3        | CAT2     |     3    |
        | Course 4 | C4        | CAT3     |     4    |
        | Course 5 | C5        | CAT3     |     5    |
    And the following "users" exist:
        | username | firstname | lastname | email                |
        | student1 | Student   | First    | student1@example.com |
        | student2 | Student   | Two      | student2@example.com |
        | student3 | Student   | Three    | student3@example.com |
        | teacher1 | teacher   | First    | teacher1@example.com |
        | teacher2 | teacher   | Two      | teacher2@example.com |
        | teacher3 | teacher   | Three    | teacher3@example.com |
    And the following "course enrolments" exist:
        | user     | course | role    |
        | student1 | C1     | student |
        | student1 | C2     | student |
        | student1 | C3     | student |
        | student1 | C4     | student |
        | admin    | C1     | manager |
        | admin    | C2     | manager |
        | admin    | C3     | manager |
        | admin    | C4     | manager |
        | teacher1 | C1     | teacher |
        | teacher2 | C2     | teacher |
        | teacher3 | C3     | teacher |

  Scenario:jumbotron activate block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "View all courses"
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I click on "s_theme_academi_jumbotronstatus" "checkbox"
    And I press "Save changes"
    And I am on site homepage
    And I should see "View all courses"

  Scenario:jumbotron title & description
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus | 1 |
    | s_theme_academi_jumbotrontitle  | Online Learning System |
    | s_theme_academi_jumbotrondesc   | LMS E-learning management system |
    And I press "Save changes"
    And I am on site homepage
    And I should see "Online Learning System"
    And I should see "LMS E-learning management system"

    And I navigate to theme settings page
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus | 1 |
    | s_theme_academi_jumbotrontitle  | |
    | s_theme_academi_jumbotrondesc   | LMS E-learning management system |
    And I press "Save changes"
    And I am on site homepage
    And I should not see "Online Learning System"
    And I should see "LMS E-learning management system"

    And I navigate to theme settings page
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus | 1 |
    | s_theme_academi_jumbotrontitle  | Online Learning System |
    | s_theme_academi_jumbotrondesc   | |
    And I press "Save changes"
    And I am on site homepage
    And I should see "Online Learning System"
    And I should not see "LMS E-learning management system"

    And I navigate to theme settings page
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus | 1 |
    | s_theme_academi_jumbotrontitle  | |
    | s_theme_academi_jumbotrondesc   | |
    And I press "Save changes"
    And I am on site homepage
    And I should not see "Online Learning System"
    And I should not see "LMS E-learning management system"

    And I navigate to theme settings page
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus    | 1 |
    | s_theme_academi_jumbotrontitle     | |
    | s_theme_academi_jumbotrondesc      | |
    | s_theme_academi_jumbotronbtntext   | |
    | s_theme_academi_jumbotronbtnlink   | |
    | s_theme_academi_jumbotronbtntarget | |
    And I press "Save changes"
    And I am on site homepage
    And I should not see "Online Learning System"
    And I should not see "LMS E-learning management system"
    And I should not see "View all courses"

  Scenario:jumbotron button
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus    | 1 |
    | s_theme_academi_jumbotrontitle     | Online Learning System |
    | s_theme_academi_jumbotrondesc      | LMS E-learning management system |
    | s_theme_academi_jumbotronbtntext   | |
    | s_theme_academi_jumbotronbtnlink   | |
    | s_theme_academi_jumbotronbtntarget | |
    And I press "Save changes"

    And I am on site homepage
    And I should see "Online Learning System"
    And I should see "LMS E-learning management system"
    And I should not see "viewallcourses"
    And I should not see "Show all courses"

    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus    | 1 |
    | s_theme_academi_jumbotrontitle     ||
    | s_theme_academi_jumbotrondesc      ||
    | s_theme_academi_jumbotronbtntext   | Show all courses |
    | s_theme_academi_jumbotronbtnlink   | http://www.example.com/ |
    | s_theme_academi_jumbotronbtntarget | 1 |
    And I press "Save changes"

    And I am on site homepage
    And I should not see "Online Learning System"
    And I should not see "LMS E-learning management system"
    And I should see "Show all courses"

    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus    | 1 |
    | s_theme_academi_jumbotrontitle     | Online Learning System |
    | s_theme_academi_jumbotrondesc      | LMS E-learning management system |
    | s_theme_academi_jumbotronbtntext   | Show all courses |
    | s_theme_academi_jumbotronbtnlink   | http://www.example.com/ |
    | s_theme_academi_jumbotronbtntarget | 1 |
    And I press "Save changes"

    And I am on site homepage
    And I should see "Online Learning System"
    And I should see "LMS E-learning management system"
    And I should see "Show all courses"

    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Jumbotron" "link"
    And I set the following fields to these values:
    | s_theme_academi_jumbotronstatus    | 1 |
    | s_theme_academi_jumbotrontitle     | Online Learning System |
    | s_theme_academi_jumbotrondesc      | LMS E-learning management system |
    | s_theme_academi_jumbotronbtntext   | Show all courses |
    | s_theme_academi_jumbotronbtnlink   | http://www.example.com/ |
    | s_theme_academi_jumbotronbtntarget | 1 |
    And I press "Save changes"

    And I am on site homepage
    And I should see "Online Learning System"
    And I should see "LMS E-learning management system"
    And I should see "Show all courses"
