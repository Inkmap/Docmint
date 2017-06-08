<?php
/************************************************
* /RENDER/PAGES/pageID
*
* requires
* * $ses['project']
* 
* rendering a page to HTML
*/
logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"rest[1] == pages","rest":"'.$ses['rest'].'"}');
/*
* check if page ID submitted, else return error
*/
if(!isset($rest[2])) {
    /*
    * No page ID submitted throw error
    */
    logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"pages not set for page rendering","rest":"'.$ses['rest'].'"}');
} else {
    $pagepath = $env['data_dir_path_abs']."/projects/".$ses['project']."/pages/".$rest[2].".yaml";
    if(!file_exists($pagepath)) {
        logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[2] page \''.$rest[2].'\' not found","rest":"'.$ses['rest'].'"}');
    } else {
        /*
        * Read page content 
        */
        $page = spyc_load_file($pagepath);
        /*
        * Our work here is done, print the HTML and die.
        */
        print renderPageHtml(json_encode($page));
        logWrite('{"type":"SUCCESS","file":"'.__FILE__.'","message":"Page content created and returned","rest":"'.$ses['rest'].'"}');
        die;
    }
}
?>