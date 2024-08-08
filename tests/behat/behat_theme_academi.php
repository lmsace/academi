<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

require_once(__DIR__ . '/../../../../lib/behat/behat_base.php');

/**
 * Step definitions related to the navigation in the academi theme.
 *
 * @package    theme_academi
 * @copyright  2023 onwards LMSACE Dev Team (http://www.lmsace.com)
 * @author    LMSACE Dev Team
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
class behat_theme_academi extends behat_base {
    /**
     * Open the automation templates listing page.
     *
     * @Given /^I navigate to theme settings page$/
     */
    public function i_navigate_to_theme_academi_settings_page() {
        global $CFG;

        if ($CFG->branch <= 403) {
            $this->execute('behat_navigation::i_navigate_to_in_site_administration',
            ['Appearance > Themes > Academi']);
        } else {
            $this->execute('behat_navigation::i_navigate_to_in_site_administration',
                [get_string('appearance', 'admin') . ' > ' . get_string('themes')]);
            $this->execute('behat_general::i_click_on_in_the', ["#theme-settings-academi", "css_element",
            "#theme-card-academi", 'css_element']);
        }
    }
}
