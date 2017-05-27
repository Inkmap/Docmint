<?php

/* 
* read all config files
*/
require_once('config.php');
if($env['debug'] == "true") {
    error_reporting(E_ALL);
    ini_set("display_errors", 1);
}
require_once($env['nonwww_dir_path_abs'].'/config/config_instance.php');

/*
* read all functions
*/
require_once($env['libs_dir_path_abs'].'/functions.php');
require_once($env['libs_dir_path_abs'].'/PHP-kit-func.php');

/*
* log this call
*/
logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"curl.php file called"}');

/*
* loading required classes for reading page config 
*/
require_once($env['spyc_class_path_abs']);

/*
* To be improved: check integrity of submitted data
*/
$ses = $_POST;

/*
* Check user token to see if this call is valid
*/
if(!checkUserToken('{"user":"'.$ses['user'].'","token":"'.$ses['token'].'"}')) {
    die('{"type":"ERROR","message":"invalid token"}');
}

/*
* start interpreting the REST command
* 
* Note: trim leading or trailing slashes
*/
$ses['rest'] = trim($ses['rest'],"/");
/*
* $rest is array of rest params
*/
$rest = explode("/", $ses['rest']);

/*****************************************************
/*****************************************************
/*****************************************************
/*
* Let's see if we get anywhere with this request
*/
switch ($rest[0]) {
    case "list":
        /************************************************
        * /LIST
        *
        * list pages, projects, users, etc. Returns JSON
        */
        logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"rest[0] == list","rest":"'.$ses['rest'].'"}');
        
        switch ($rest[1]) {
            case "pages":
                /************************************************
                * /LIST/PAGES
                *
                * listing pages
                */
                logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"rest[1] == pages","rest":"'.$ses['rest'].'"}');
                $pagespath = $env['data_dir_path_abs']."/projects/".$ses['project']."/pages";
                
                if(!file_exists($pagespath)) {
                    logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"folder pages not found","rest":"'.$ses['rest'].'"}');
                } else {
                    /*
                    * Read files in pages directory 
                    */
                    $pages = dir_list_files($pagespath);
                    
                    /*
                    * Our work here is done, print the JSON and die.
                    */
                    print json_encode($pages);
                    logWrite('{"type":"SUCCESS","file":"'.__FILE__.'","message":"List of pages created and returned","rest":"'.$ses['rest'].'"}');
                    die;
                }
                break;
            default:
                logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[1] not valid","rest":"'.$ses['rest'].'"}');
                die('{"type":"ERROR","message":"invalid request"}');
        }
    case "render":
        /************************************************
        * /RENDER
        *
        * rendering a page or site to html, json or yaml
        */
        logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"rest[0] == render","rest":"'.$ses['rest'].'"}');
        
        switch ($rest[1]) {
            case "pages":
                /************************************************
                * /RENDER/PAGES/pageID
                * 
                * creating a page
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
                        logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[2] page not found","rest":"'.$ses['rest'].'"}');
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
                break;
            default:
                logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[1] not valid","rest":"'.$ses['rest'].'"}');
                die('{"type":"ERROR","message":"invalid request"}');
        }
        break;
    default:
        /*
        * found nothing useful, throw error and die.
        */
        logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[0] not valid","rest":"'.$ses['rest'].'"}');
        die('{"type":"ERROR","message":"invalid request"}');
}

?>