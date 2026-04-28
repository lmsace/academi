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

/**
 * Login Layout
 *
 * @package    theme_academi
 * @copyright  2015 onwards LMSACE Dev Team (http://www.lmsace.com)
 * @author     LMSACE Dev Team
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
defined('MOODLE_INTERNAL') || die();

$bodyattributes = $OUTPUT->body_attributes();
require_once(dirname(__FILE__) . '/includes/layoutdata.php');

$theme = theme_config::load('boost');
$leftinstructions = !empty($CFG->auth_instructions)
    ? format_text($CFG->auth_instructions, FORMAT_MOODLE, ['context' => context_system::instance()])
    : null;

// Check if custom login background image is set.
$hasloginbackgroundimage = !empty($theme->setting_file_url('loginbackgroundimage', 'loginbackgroundimage'));
$showdefaultloginpanel = theme_academi_get_setting('showdefaultloginpanel') ?? false;

$showleftpanel = !empty($leftinstructions) || $hasloginbackgroundimage || $showdefaultloginpanel;

$templatecontext += [
    'sitename' => format_string($SITE->shortname, true, ['context' => context_course::instance(SITEID), "escape" => false]),
    'output' => $OUTPUT,
    'bodyattributes' => $bodyattributes,
    'leftinstructions' => $leftinstructions,
    'showleftpanel' => $showleftpanel,
    'showdefaultloginpanel' => $showdefaultloginpanel,
];
echo $OUTPUT->render_from_template('theme_academi/login', $templatecontext);
