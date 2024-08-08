@theme @theme_academi @_file_upload @javascript

Feature:Check promoted courses in theme_academi in the "Promoted courses" tab on the "Academi" theme settings page
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

  Scenario:Promoted courses activate block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "Promoted Courses"
    And I navigate to theme settings page
    #--Hide promoted courses block in site homepage--#
    And I click on "Promoted Courses" "link"
    And I click on "Activate block" "checkbox"
    And I set the field "Promoted Courses" to "195000,195001,195002,195004,195003"
    And I press "Save changes"
    And I am on site homepage
    And I should not see "Promoted Courses"
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Promoted Courses" "link"
    And I click on "Activate block" "checkbox"
    And I press "Save changes"
    And I am on site homepage
    And I should see "PROMOTED COURSES"
    And I log out
    #--Student login--#
    And I log in as "student1"
    And I am on site homepage
    And I should see "PROMOTED COURSES"
    And I log out
    #--Teacher login--#
    And I log in as "teacher1"
    And I am on site homepage
    And I should see "PROMOTED COURSES"
    And I log out

  Scenario:Promoted courses title block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "Promoted Courses"
    And I navigate to theme settings page
    #--show promoted courses block in site homepage--#
    And I click on "Promoted Courses" "link"
    And I set the field "Title" to "Promoted Courses block"
    And I set the field "Promoted Courses" to "195000,195001,195002,195004,195003"
    And I press "Save changes"
    And I am on site homepage
    And I should not see "PROMOTED COURSES"
    And I should see "Promoted Courses block"

  Scenario:Promoted courses description block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "Promoted Courses"
    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"

    #--show promoted courses block in site homepage--#
    And I set the field "Title" to "Promoted Courses block"
    And I set the field "s_theme_academi_promotedcoursedesc" to "Promoted Courses description block"
    And I set the field "Promoted Courses" to "195000,195001,195002,195004,195003"
    And I press "Save changes"
    And I am on site homepage
    And I should not see "PROMOTED COURSES"
    And I should see "Promoted Courses block"
    And I should see "Promoted Courses description block"

    #--Hide promoted courses block in site homepage--#
    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the field "Title" to "Promoted Courses block"
    And I set the field "s_theme_academi_promotedcoursedesc" to ""
    And I set the field "Promoted Courses" to "195000,195001,195002,195004,195003"
    And I press "Save changes"
    And I am on site homepage
    And I should not see "PROMOTED COURSES"
    And I should not see "Promoted Courses description block"

  Scenario:Promoted courses courseid block
    Given I log in as "admin"
    And I am on site homepage
    And I should not see "Promoted Courses"
    #And I click on "Close block drawer" "button" in the "#theme_boost-drawers-blocks" "css_element"
    And I navigate to theme settings page
    #--Show promoted courses block in site homepage--#
    And I click on "Promoted Courses" "link"
    And I set the field "Title" to "Promoted Courses block"
    And I set the field "s_theme_academi_promotedcoursedesc" to "Promoted Courses description block"
    And I set the field "Promoted Courses" to "195000,195003,195002,195004,195001"
    And I press "Save changes"
    And I am on site homepage
    And I should not see "PROMOTED COURSES"
    And I should see "Promoted Courses block"
    And I should see "Promoted Courses description block"

    #--change course id order--#
    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the following fields to these values:
    | Promoted Courses | 195000,195001,195002,195003,195004 |
    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the following fields to these values:
    | Promoted Courses | 195000, |
    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the following fields to these values:
    | Promoted Courses | ,195004 |
    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the following fields to these values:
    | Promoted Courses | 195000,  ,195004 |
    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the following fields to these values:
    | Promoted Courses |  |
    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    And I click on "Promoted Courses" "link"
    And I set the following fields to these values:
    | Promoted Courses | 195000,195001,195002,195003,195004 |
    And I should not see "Promoted Courses block"
    And I should see "Promoted Courses description block"
    And I press "Save changes"
    And I am on site homepage