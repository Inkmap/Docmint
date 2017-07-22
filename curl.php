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
//logWrite('{"type":"DEBUG","file":"'.__FILE__.'","message":"curl.php file called"}');

/*
* loading required classes for reading page config 
*/
require_once($env['spyc_class_path_abs']);

/*
* To be improved: check integrity of submitted data
*/
$ses = $_POST;

/*
* Check user rights
* TODO
*/

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
            case "projects":
                /************************************************
                * /LIST/PROJECTS
                *
                * requires
                * * $ses['user']
                * 
                * listing available projects
                */
                include($env['libs_dir_path_abs'].'/curl/curl__list__projects.php');
                break;
            case "pages":
                /************************************************
                * /LIST/PAGES
                *
                * requires
                * * $ses['project']
                * 
                * listing pages
                */
                include($env['libs_dir_path_abs'].'/curl/curl__list__pages.php');
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
                * requires
                * * $ses['project']
                * 
                * rendering a page to HTML
                */
                include($env['libs_dir_path_abs'].'/curl/curl__render__pages__pageID.php');
                break;
            case "projects":
                /************************************************
                * /RENDER/PROJECTS/projectID
                * 
                * rendering all pages of a project to HTML
                */
                include($env['libs_dir_path_abs'].'/curl/curl__render__projects__projectID.php');
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