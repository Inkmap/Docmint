<?php

$smarty->assign('env',$env);
$smarty->assign('page',$page);

/*
* Loop through all the elements to create navigation HTML
*/
$navlinks = array();
foreach($page['elements'] as $element) {
    if(isset($element['meta']['id'])) {
        if(isset($element['meta']['textnav'])) {
            $navlinks[$element['meta']['id']] = $element['meta']['textnav'];
        } else {
            $navlinks[$element['meta']['id']] = $element['meta']['id'];
        }
    }
}
//print "<pre>\$element\n"; print_r($navlinks); print "</pre>";
$smarty->assign('navlinks',$navlinks);

/*
* Start building HTML
*/
$html = $smarty->fetch('index_start.tpl');

/*
* Create navigation bar
*/
$html .= $smarty->fetch('tpl/snippet_navTop.tpl');

/*
* Loop through all the elements and add HTML to the page
*/

foreach($page['elements'] as $element) {
    //print "<pre>\$element\n"; print_r($element); print "</pre>";
    $smarty->assign('e',$element);
    switch ($element['meta']['snippet']) {
        case "navTop":
            $html .= $smarty->fetch('tpl/snippet_navTop.tpl');
            break;
        case "header":
            $html .= $smarty->fetch('tpl/snippet_header.tpl');
            break;
        case "headerVideo":
            $html .= $smarty->fetch('tpl/snippet_headerVideo.tpl');
            break;
        case "3ItemsWithIcons":
            $html .= $smarty->fetch('tpl/snippet_3ItemsWithIcons.tpl');
            break;
        case "4ItemsWithIcons":
            $html .= $smarty->fetch('tpl/snippet_4ItemsWithIcons.tpl');
            break;
        case "3PortfolioModalGrid":
            $html .= $smarty->fetch('tpl/snippet_3PortfolioModalGrid.tpl');
            break;
        case "4PortfolioModalGrid":
            $html .= $smarty->fetch('tpl/snippet_4PortfolioModalGrid.tpl');
            break;
        case "timelineSimple":
            $html .= $smarty->fetch('tpl/snippet_timelineSimple.tpl');
            break;
        case "3TeamRound":
            $html .= $smarty->fetch('tpl/snippet_3TeamRound.tpl');
            break;
        case "4TeamRound":
            $html .= $smarty->fetch('tpl/snippet_4TeamRound.tpl');
            break;
        case "3Logos":
            $html .= $smarty->fetch('tpl/snippet_3Logos.tpl');
            break;
        case "4Logos":
            $html .= $smarty->fetch('tpl/snippet_4Logos.tpl');
            break;
        case "6Logos":
            $html .= $smarty->fetch('tpl/snippet_6Logos.tpl');
            break;
        case "contactForm":
            $html .= $smarty->fetch('tpl/snippet_contactForm.tpl');
            break;
        case "footerSimpleSocial":
            $html .= $smarty->fetch('tpl/snippet_footerSimpleSocial.tpl');
            break;
        default:
           print "<h1>Element type '".$element['meta']['snippet']."' not found!</h1>";
    } // end switch
}

/*
* End building HTML
*/
$html .= $smarty->fetch('index_end.tpl');

?>