@javascript @theme_academi

Feature: Configuring the theme_academi for the "General" tab on the "Academi" theme setting page

In order to use the features
  As admin
  I need to be able to configure the theme Academi

  Background:
    Given the following "categories" exist:
      | name           | category | idnumber | category |
      | Category E     | 0        | CE       | 0        |
      | Category ED    | 1        | CED      | CE       |
      | Category EDC   | 2        | CEDC     | CED      |
      | Category EDCB  | 3        | CEDCB    | CEDC     |
      | Category EDCBA | 4        | CEDCBA   | CEDCB    |
    And the following "courses" exist:
      | fullname  | shortname | category |
      | Course C1 | CC1       | CE       |
      | Course C2 | CC2       | CED      |
      | Course C3 | CC3       | CEDC     |
      | Course C4 | CC4       | CEDCB    |
      | Course C5 | CC5       | CEDCBA   |
    And I log in as "admin"
    And I change window size to "large"

  @javascript @_file_upload
  Scenario: Setting: Replace logo and add Favicon
    Given I am on site homepage
    And I navigate to "Appearance > Themes > Academi" in site administration
    And I click on "Homepage Slider" "link" in the "#adminsettings .nav-tabs" "css_element"
    And I select "Yes" from the "Slide show display" singleselect
    And I select "Yes" from the "Auto play" singleselect
    And I set the following fields to these values:
        | s_theme_academi_slideinterval | 4000 |
    And I select "0.7" from the "Overlay opacity" singleselect
    And I select "2" from the "Number of slides" singleselect
    And I select "Enable" from the "Status (Slide #1)" singleselect
    And I delete "slide1image.jpg" from "Slide image" filemanager
    And I upload "theme/academi/tests/fixtures/slide.jpg" file to "Slide image" filemanager
    And I set the following fields to these values:
        | s_theme_academi_slide1contentstatus | 1 |
        | s_theme_academi_slide1caption | Slider 1 |
        | s_theme_academi_slide1desc | Enter the description of the slide |
        | s_theme_academi_slide1btntext | Button 1 |
        | s_theme_academi_slide1btnurl | http://www.google.com/ |
    And I select "Same Window" from the "Button Target" singleselect
    And I set the following fields to these values:
        | s_theme_academi_slide1contFullwidth | 70 |
    And I select "TopRight" from the "Content position" singleselect
    And I press "Save changes"
    And I am on site homepage

  # Scenario: Setting: Replace logo and add Favicon
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "General" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I delete "logo.png" from "Logo" filemanager
  #   And I upload "theme/academi/tests/fixtures/logo1.png" file to "Logo" filemanager
  #   And I press "Save changes"
  #   And I upload "theme/academi/tests/fixtures/favicon.png" file to "Favicon" filemanager
  #   And I set the following fields to these values:
  #     | Primary color | #0424CD |
  #     | Secondary color | #A200B4 |
  #     | Header style | Moodle based |
  #     | Inner Page content size | Custom |
  #     | Page content Custom value | 1000 |
  #     | Content Font Size | Large |
  #     | Available courses display style | Moodle based |
  #     | Combo list display style | Expanded |
  #     | Add back to top button | No |
  #   And I press "Save changes"
  #   And I upload "theme/academi/tests/fixtures/slide.jpg" file to "Background image" filemanager
  #   And I press "Save changes"
  #   And I upload "theme/academi/tests/fixtures/login.jpg" file to "Login background image" filemanager
  #   And I press "Save changes"

  #   And I click on "Promoted Courses" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_pcoursestatus       |    0    |
  #     | s_theme_academi_pcoursestatus       |    1    |
  #     | s_theme_academi_promotedtitle       |    Promo course  |
  #     | s_theme_academi_promotedcoursedesc  |    Promo course  |
  #     | Promoted Courses  |   1,2,3,4  |

  #   And I click on "Site features" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_sitefblockstatus  |  0  |
  #     | s_theme_academi_sitefblockstatus  |  1  |
  #     | s_theme_academi_sitefeaturetitle  |    Site feature block  |
  #     | s_theme_academi_sitefeaturedesc   |    Site feature block  |
  #   And I select "2" from the "Number of site features" singleselect

  #   And I set the following fields to these values:
  #   # | s_theme_academi_sitefblock1status  |  0  |
  #     | s_theme_academi_sitefblock1status  |  1  |
  #     | s_theme_academi_sitefblock1title   |  Site Feature 1  |
  #     | s_theme_academi_sitefblock1content |  Site Feature 1 Desc  |
  #     | s_theme_academi_sitefblock1icon    |  volume-down  |

  #   And I click on "Marketing Spot" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_mspotstatus  |  0  |
  #     | s_theme_academi_mspotstatus  |  1  |
  #     | s_theme_academi_mspottitle   |  Marketing block  |
  #     | s_theme_academi_mspotdesc    |  To set the Description   |
  #     | s_theme_academi_mspotcontent |  Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea. Quas molestiae perspiciatis occaecati qui rerum. Deleniti quod porro sed quisquam saepe. Numquam mollitia recusandae non ad at et a.   |
  #   And I delete "mspotmedia.png" from "Media" filemanager
  #   And I upload "theme/academi/tests/fixtures/mspot.png" file to "Media" filemanager
  #   And I press "Save changes"

  #   And I click on "Jumbotron" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_mspotstatus  |  0  |
  #     | s_theme_academi_jumbotronstatus  |  1  |
  #     | s_theme_academi_jumbotrontitle   |  Marketing block  |
  #     | s_theme_academi_jumbotrondesc    |  To set the Description   |
  #     | s_theme_academi_jumbotronbtntext   |  Marketing block  |
  #     | s_theme_academi_jumbotronbtnlink   |  Marketing block  |
  #   And I select "Same Window" from the "Button target" singleselect

  #   And I click on "Footer" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
  #   And I select "0.7" from the "Footer Overlay Opacity" singleselect
  #   And I set the following fields to these values:
  #     | s_theme_academi_copyright_footer |  Copyright &copy; 2023  |
  #   # | s_theme_academi_footerb1_status  |  0  |
  #     | s_theme_academi_footerb1_status  |  1  |
  #     | s_theme_academi_footerbtitle1    |  Footer block 1  |
  #     | s_theme_academi_footnote         |  Lorem Ipsum is simply dummy text of the printing  |
  #   And I press "Save changes"
  #   And I click on "Footer" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I delete "footerlogo.png" from "Footer logo" filemanager
  #   And I upload "theme/academi/tests/fixtures/logo1.png" file to "Footer logo" filemanager
  #   And I set the following fields to these values:
  #     | s_theme_academi_footerb2_status  |  1  |
  #     | s_theme_academi_infolink |  Copyright &copy; 2023  |
  #     | s_theme_academi_footerb3_status  |  1  |
  #     | s_theme_academi_address |  308 Negra Narrow Lane  |
  #     | s_theme_academi_emailid |  info@gmail.com  |
  #     | s_theme_academi_phoneno |  123-456-2023  |
  #     | s_theme_academi_footerb4_status  |  1  |
  #   And I select "2" from the "Footer Overlay Opacity" singleselect
  #   And I set the following fields to these values:
  #     | s_theme_academi_socialmedia1_icon  |  facebook-f  |
  #     | s_theme_academi_socialmedia2_url  |  https://www.google.com/+yourgoogleplusid  |
  #     | s_theme_academi_socialmedia1_icon  |  #cd2129  |
  #     | s_theme_academi_socialmedia1_icon  |  pinterest-p |
  #     | s_theme_academi_socialmedia2_url  |  https://in.pinterest.com/yourpinterestname/  |
  #     | s_theme_academi_socialmedia1_icon  |  #e84c3d  |
  #   And I press "Save changes"
  #   And I am on site homepage
    # And I log out
    # And I am on site homepage
    # And I follow "Log in"


  # @javascript
  # Scenario: Setting: Primary & Secondary color
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "General" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #     | Primary color | #0424CD |
  #     | Secondary color | #A200B4 |
  #   And I set the following fields to these values:
  #     | Header style | Moodle based |
  #   And I set the following fields to these values:
  #     | Inner Page content size | Custom |
  #   And I set the following fields to these values:
  #     | Page content Custom value | 450 |
  #   And I set the following fields to these values:
  #     | Content Font Size | Large |
  #   And I set the following fields to these values:
  #     | Available courses display style | Moodle based |
  #   And I set the following fields to these values:
  #     | Combo list display style | Expanded |
  #   And I set the following fields to these values:
  #     | Add back to top button | No |
  #   And I press "Save changes"
  #   And I am on site homepage

  # @javascript @_file_upload
  # Scenario: Setting: Background image
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "General" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   # And I upload "theme/academi/tests/fixtures/slide.jpg" file to "Background image" filemanager
  #   And I upload "theme/academi/tests/fixtures/login.jpg" file to "Login background image" filemanager
  #   And I press "Save changes"
  #   And I am on site homepage
  #   And I log out
  #   And I am on site homepage
  #   And I follow "Log in"
  #   Then "//div[@id='page-login-index']/*[1][contains(@style, 'pluginfile.php/1/theme_academi/backgroundimage/1/login.jpg')]" "xpath_element" should not exist
  #   Then "//div[@id='page-login-index']/*[1][contains(@style, 'pluginfile.php/1/theme_academi/backgroundimage/1/login.jpg')]" "xpath_element" should not exist
  #   Then "//body[@class='jsenabled']/*[1][contains(@style, 'pluginfile.php/1/theme_academi/backgroundimage/1/login.jpg')]" "xpath_element" should exist

  # @javascript @_file_upload
  # Scenario: Setting: Promoted courses
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "Promoted Courses" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #    #| s_theme_academi_pcoursestatus       |    0    |
  #     | s_theme_academi_pcoursestatus       | 1      |
  #     | s_theme_academi_promotedtitle       |    Promo course  |
  #     | s_theme_academi_promotedcoursedesc  |    Promo course  |
  #     | Promoted Courses  |   1,2,3,4  |
  #   And I press "Save changes"
  #   And I am on "Course C1" course homepage
  #   And I am on site homepage

  # @javascript @_file_upload
  # Scenario: Setting: Site Features
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "Site features" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_sitefblockstatus  |  0  |
  #     | s_theme_academi_sitefblockstatus  |  1  |
  #     | s_theme_academi_sitefeaturetitle  |    Site feature block  |
  #     | s_theme_academi_sitefeaturedesc   |    Site feature block  |
  #   And I select "2" from the "Number of site features" singleselect

  #   And I set the following fields to these values:
  #   # | s_theme_academi_sitefblock1status  |  0  |
  #     | s_theme_academi_sitefblock1status  |  1  |
  #     | s_theme_academi_sitefblock1title   |  Site Feature 1  |
  #     | s_theme_academi_sitefblock1content |  Site Feature 1 Desc  |
  #     | s_theme_academi_sitefblock1icon    |  volume-down  |
  #   And I press "Save changes"
  #   And I am on site homepage

  # @javascript @_file_upload
  # Scenario: Setting: Marketing Spot
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "Marketing Spot" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_mspotstatus  |  0  |
  #     | s_theme_academi_mspotstatus  |  1  |
  #     | s_theme_academi_mspottitle   |  Marketing block  |
  #     | s_theme_academi_mspotdesc    |  To set the Description   |
  #     | s_theme_academi_mspotcontent |  Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea. Quas molestiae perspiciatis occaecati qui rerum. Deleniti quod porro sed quisquam saepe. Numquam mollitia recusandae non ad at et a.   |
  #   And I delete "mspotmedia.png" from "Media" filemanager
  #   And I upload "theme/academi/tests/fixtures/mspot.png" file to "Media" filemanager
  #   And I press "Save changes"
  #   And I am on site homepage
    # Then "//div[@id='marketingspot']/*[1][contains(@style, 'pluginfile.php/1/theme_academi/mspotmedia/mspot.png')]" "xpath_element" should exist

  # @javascript @_file_upload
  # Scenario: Setting: Jumbotron
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "Jumbotron" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   And I set the following fields to these values:
  #   # | s_theme_academi_mspotstatus  |  0  |
  #     | s_theme_academi_jumbotronstatus  |  1  |
  #     | s_theme_academi_jumbotrontitle   |  Marketing block  |
  #     | s_theme_academi_jumbotrondesc    |  To set the Description   |
  #     | s_theme_academi_jumbotronbtntext   |  Marketing block  |
  #     | s_theme_academi_jumbotronbtnlink   |  Marketing block  |
  #   And I select "Same Window" from the "Button target" singleselect
  #   And I press "Save changes"
  #   And I am on site homepage

  # @javascript @_file_upload
  # Scenario: Setting: Marketing Spot
  #   Given I am on site homepage
  #   And I navigate to "Appearance > Themes > Academi" in site administration
  #   And I click on "Footer" "link" in the "#adminsettings .nav-tabs" "css_element"
  #   # And I upload "theme/academi/tests/fixtures/login.jpg" file to "Footer background Image" filemanager
  #   And I select "0.7" from the "Footer Overlay Opacity" singleselect
  #   And I set the following fields to these values:
  #     | s_theme_academi_copyright_footer |  Copyright &copy; 2023  |
  #   # | s_theme_academi_footerb1_status  |  0  |
  #     | s_theme_academi_footerb1_status  |  1  |
  #     | s_theme_academi_footerbtitle1    |  Footer block 1  |
  #     | s_theme_academi_footnote         |  Lorem Ipsum is simply dummy text of the printing  |
  #   And I delete "footerlogo.png" from "Footer logo" filemanager
  #   And I upload "theme/academi/tests/fixtures/logo1.png" file to "Footer logo" filemanager
  #   And I set the following fields to these values:
  #     | s_theme_academi_footerb2_status  |  1  |
  #     | s_theme_academi_infolink |  Copyright &copy; 2023  |
  #     | s_theme_academi_footerb3_status  |  1  |
  #     | s_theme_academi_address |  308 Negra Narrow Lane  |
  #     | s_theme_academi_emailid |  info@gmail.com  |
  #     | s_theme_academi_phoneno |  123-456-2023  |
  #     | s_theme_academi_footerb4_status  |  1  |
  #   And I select "2" from the "Footer Overlay Opacity" singleselect
  #   And I set the following fields to these values:
  #     | s_theme_academi_socialmedia1_icon  |  facebook-f  |
  #     | s_theme_academi_socialmedia2_url  |  https://www.google.com/+yourgoogleplusid  |
  #     | s_theme_academi_socialmedia1_icon  |  #cd2129  |
  #     | s_theme_academi_socialmedia1_icon  |  pinterest-p |
  #     | s_theme_academi_socialmedia2_url  |  https://in.pinterest.com/yourpinterestname/  |
  #     | s_theme_academi_socialmedia1_icon  |  #e84c3d  |
  #   And I press "Save changes"
  #   And I am on site homepage
    # Then "//div[@id='marketingspot']/*[1][contains(@style, 'pluginfile.php/1/theme_academi/mspotmedia/mspot.png')]" "xpath_element" should exist