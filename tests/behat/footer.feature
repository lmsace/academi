@theme @theme_academi @_file_upload @javascript

Feature:Check footer in theme_academi in the "Footer" tab on the "Academi" theme settings page
  In order to use the features
  As a admin
  I need to manage theme settings in the system

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | student1 | Student   | First    | student1@example.com |
      | student2 | Student   | Two      | student2@example.com |
      | student3 | Student   | Three    | student3@example.com |
      | teacher1 | teacher   | First    | teacher1@example.com |
      | teacher2 | teacher   | Two      | teacher2@example.com |
      | teacher3 | teacher   | Three    | teacher3@example.com |

  Scenario:General footer block
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    #--Show Footer block in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/favicon.png" file to "Footer background Image" filemanager
    And I set the field "Footer Overlay Opacity" to "0.5"
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I press "Save changes"
    And I am on site homepage
    #--Hide Footer blocks & social media--#
    And I navigate to theme settings page
    And I click on "Footer" "link"
    And I click on "s_theme_academi_footerb1_status" "checkbox"
    And I click on "s_theme_academi_footerb2_status" "checkbox"
    And I click on "s_theme_academi_footerb3_status" "checkbox"
    And I click on "s_theme_academi_footerb4_status" "checkbox"
    And I click on "s_theme_academi_socialmedia1_status" "checkbox"
    And I click on "s_theme_academi_socialmedia2_status" "checkbox"
    And I click on "s_theme_academi_socialmedia3_status" "checkbox"
    And I click on "s_theme_academi_socialmedia4_status" "checkbox"

    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    #--Hide Footer block Bgimage, overlay, copyright--#
    And I click on "Footer" "link"
    And I delete "bgimage.png" from "Footer background Image" filemanager
    And I set the field "Footer Overlay Opacity" to ""
    And I set the field "Copyright" to ""
    And I press "Save changes"
    And I am on site homepage

    And I navigate to theme settings page
    #--Show Footer block copyright--#
    And I click on "Footer" "link"
    And I set the field "Footer Overlay Opacity" to ""
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I press "Save changes"
    And I am on site homepage

  Scenario:Footer block 1
    Given I log in as "admin"
    And I am on site homepage
    And I navigate to theme settings page
    #--Show Footer block in site homepage--#
    And I click on "Footer" "link"
    And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
    And I set the field "Copyright" to "Copyright &copy; 2024"
    And I wait "5" seconds
    And I set the field "s_theme_academi_footerb1_status" to "1"
    And I set the field "s_theme_academi_footerbtitle1" to "1Block 1"
    And I set the following fields to these values:
      | s_theme_academi_footerb1_status | 1 |
      | s_theme_academi_footerbtitle1 | Block 1 |
      | Enable Footer logo | 1 |
      | Footnote | You can configure a custom Info Links here to be shown by themes. Each line consists of some menu text, a link |
    And I delete "footerlogo.png" from "Footer logo" filemanager
    And I upload "theme/academi/tests/fixtures/logo.png" file to "Footer logo" filemanager
    And I press "Save changes"
    And I am on site homepage
    And I wait "5" seconds
