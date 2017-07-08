<?php

$smarty->assign('env',$env);
$smarty->assign('page',$page);

logWrite(
    json_encode(
        array(
            "type" => "DEBUG",
            "message" => "Starting smarty compilation",
            "file" => __FILE__,
            "fileLine" => __LINE__,
            "pageconfig.meta" => $page['meta'],
        )
    )
);

/*
* Loop through all the elements to create navigation HTML
*/
$navlinks = array();
foreach($page['elements'] as $element) {
    if(isset($element['meta']['id'])) {
        if(isset($element['meta']['textNav'])) {
            $navlinks[$element['meta']['id']] = $element['meta']['textNav'];
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
$html = $smarty->fetch($page['meta']['theme'].'/index_start.tpl');
/*
logWrite(
    json_encode(
        array(
            "type" => "DEBUG",
            "message" => "Content of 'index_start.tpl'",
            "file" => __FILE__,
            "fileLine" => __LINE__,
            "index_start.tpl" => $html,
        )
    )
);
/**/
/*
* Create navigation bar
*/
$html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_navTop.tpl');

/*
* Loop through all the elements and add HTML to the page
*/

foreach($page['elements'] as $element) {
    //print "<pre>\$element\n"; print_r($element); print "</pre>";
    $smarty->assign('e',$element);
/**/
logWrite(
    json_encode(
        array(
            "type" => "DEBUG",
            "message" => "Content of element array",
            "file" => __FILE__,
            "fileLine" => __LINE__,
            "element" => $element,
        )
    )
);
/**/
    switch ($element['meta']['snippet']) {
        case "navTop":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_navTop.tpl');
            break;
        case "header":
/**
logWrite(
    json_encode(
        array(
            "type" => "DEBUG",
            "message" => "Content before header html snippet",
            "file" => __FILE__,
            "fileLine" => __LINE__,
            "element" => $html,
        )
    )
);
/**/
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_header.tpl');
/**
logWrite(
    json_encode(
        array(
            "type" => "DEBUG",
            "message" => "Content after header html snippet",
            "file" => __FILE__,
            "fileLine" => __LINE__,
            "element" => $html,
        )
    )
);
/**/
            break;
        case "headerVideo":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_headerVideo.tpl');
            break;
        case "textBig":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_textBig.tpl');
            break;
        case "textBig2Col":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_textBig2Col.tpl');
            break;
        case "3ItemsWithIcons":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_3ItemsWithIcons.tpl');
            break;
        case "4ItemsWithIcons":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_4ItemsWithIcons.tpl');
            break;
        case "3PortfolioModalGrid":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_3PortfolioModalGrid.tpl');
            break;
        case "4PortfolioModalGrid":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_4PortfolioModalGrid.tpl');
            break;
        case "timelineSimple":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_timelineSimple.tpl');
            break;
        case "3TeamRound":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_3TeamRound.tpl');
            break;
        case "4TeamRound":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_4TeamRound.tpl');
            break;
        case "3Logos":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_3Logos.tpl');
            break;
        case "4Logos":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_4Logos.tpl');
            break;
        case "6Logos":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_6Logos.tpl');
            break;
        case "contactForm":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_contactForm.tpl');
            break;
        case "footerSimpleSocial":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_footerSimpleSocial.tpl');
            break;
        case "googleMap":
            $html .= $smarty->fetch($page['meta']['theme'].'/tpl/snippet_googleMap.tpl');
            break;
        default:
           print "<h1>Element type '".$element['meta']['snippet']."' not found!</h1>";
    } // end switch
}

/**
logWrite(
    json_encode(
        array(
            "type" => "DEBUG",
            "message" => "HTML Content of page",
            "file" => __FILE__,
            "fileLine" => __LINE__,
            "index_start.tpl" => $html,
        )
    )
);
/**/
/*
* End building HTML
*/
$html .= $smarty->fetch($page['meta']['theme'].'/index_end.tpl');

?>