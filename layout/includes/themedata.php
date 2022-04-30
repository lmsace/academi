<?php

// Header Content.
$logourl = get_logo_url();
$phoneno = theme_academi_get_setting('phoneno');
$emailid = theme_academi_get_setting('emailid');
$scallus = get_string('callus', 'theme_academi');
$semail = get_string('email', 'theme_academi');
$themestyleheader = theme_academi_get_setting('themestyleheader');
// Footer Content.
$logourl = get_logo_url();
$footlogo = theme_academi_get_setting('footlogo');
$footlogo = (!$footlogo) ? 0 : 1;
$footnote = theme_academi_get_setting('footnote', 'format_html');
$fburl = theme_academi_get_setting('fburl');
$pinurl = theme_academi_get_setting('pinurl');
$twurl = theme_academi_get_setting('twurl');
$gpurl = theme_academi_get_setting('gpurl');
$address = theme_academi_get_setting('address');
$emailid = theme_academi_get_setting('emailid');
$phoneno = theme_academi_get_setting('phoneno');
$copyrightfooter = theme_academi_get_setting('copyright_footer','format_html');
$infolink = theme_academi_get_setting('infolink');
$infolink = theme_academi_infolink();

$custommenu = $OUTPUT->custom_menu();
if ($custommenu == "") {
    $navbarclass = "navbar-toggler d-lg-none nocontent-navbar";
} else {
    $navbarclass = "navbar-toggler d-lg-none";
}

$sinfo = get_string('info', 'theme_academi');
$scontactus = get_string('contact_us', 'theme_academi');
$phone = get_string('phone', 'theme_academi');
$email = get_string('email', 'theme_academi');
$sfollowus = get_string('followus', 'theme_academi');

$url = ($fburl != '' || $pinurl != '' || $twurl != '' || $gpurl != '') ? 1 : 0;
$block3 = ($address != '' || $phoneno != '' || $emailid != '' || $url != 0) ? 1 : 0;
$footerblock1 = ($footlogo != 0 || $footnote != '' || $infolink != '' || $url != 0 || $block3 != 0) ? 1 : 0;

$footerblock = ($footlogo != 0 || $footnote != '' || $infolink != ''
    || $url != 0 || $block3 != 0 || $copyrightfooter != '') ? 1 : 0;

$block1 = ($footlogo || $footnote) ? 1 : 0;
$infoslink = ($infolink != '') ? 1 : 0;
$blockarrange = $block1 + $infoslink + $block3;

switch ($blockarrange) {
    case 3:
        $colclass = 'col-md-4';
        break;
    case 2:
        $colclass = 'col-md-6';
        break;
    case 1:
        $colclass = 'col-md-12';
        break;
    case 0:
        $colclass = '';
        break;
    default:
        $colclass = 'col-md-4';
        break;
}

$templatecontext = [
    "logourl"          => $logourl,
    "phoneno"          => $phoneno,
    "emailid"          => $emailid,
    "footlogo"         => $footlogo,
    "footnote"         => $footnote,
    "fburl"            => $fburl,
    "pinurl"           => $pinurl,
    "twurl"            => $twurl,
    "gpurl"            => $gpurl,
    "address"          => $address,
    "copyright_footer" => $copyrightfooter,
    "infolink"         => $infolink,
    "s_contact_us"     => $scontactus,
    "phone"            => $phone,
    "email"            => $email,
    "s_followus"       => $sfollowus,
    "socialurl"        => $url,
    "navbarclass"      => $navbarclass,
    "block3"           => $block3,
    "footerblock"      => $footerblock,
    "footerblock1"     => $footerblock1,
    "colclass"         => $colclass,
    "block1"           => $block1,
    'themestyleheader' => $themestyleheader

   
];