<?php

/*************************************
* Rendering pages
*/

function renderPageHtmlUrl(&$item, $key, $relPathPrefix) {
    if($key == "url" || $key == "imgUrl" || $key == "bgImgUrl" || $key == "socialImgUrl" || $key == "data-background") {
        if(string_startsWith($item, "#")) {
            /*
            * relative path within page
            */
        } elseif(string_startsWith($item, "http")) {
            /*
            * external link
            */
        } elseif(string_startsWith($item, "*")) {
            /*
            * link to static file
            * also need relative link prefix
            */
            $item = $relPathPrefix."static/".ltrim($item, '*');
        } elseif(string_startsWith($item, "mailto:")) {
            /*
            * mail address
            */
        } else {
            /*
            * relative link to separate page
            */
            $item = $relPathPrefix.$item;
        }
    }
}

function renderPageRelPathPrefix($relurl) {
    /*
    * Creates a relative path upwards
    * based on the url the rendered page will have
    */
    $depth = explode("/", $relurl);
    if(count($depth) > 1) {
        // page will be nested, create prefix with ../ times depth
        $v['relPathPrefix'] = "";
        $counter = count($depth) - 1;
        while($counter > 0) {
            $counter--;
            $v['relPathPrefix'] .= "../";
        } 
    }
    return $v['relPathPrefix'];
}

function renderPageHtml($json) {
    global $env;
    // convert JSON to array
    $v = json_decode($json, true);
    // minimum check: theme sent?
    if(!isset($v['meta']['theme'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"theme not set"}');
        return FALSE;
    }
    // minimum check: theme file for handling page exists?
    $themehandlerpath = $env['nonwww_dir_path_abs'].'/templates/'.$v['meta']['theme'].'/makeHtml_'.$v['meta']['theme'].'.php';
    if(!file_exists($themehandlerpath)) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"Theme handler not found makeHtml_'.$v['meta']['theme'].'.php"}');
        return FALSE;
    }
    logWrite('{"type":"INFO","function":"'.__FUNCTION__.'","message":"Theme handler found makeHtml_'.$v['meta']['theme'].'.php"}');
   
    /*
    * Figure out if the page is in a subdir and give relative prefix (../) to the template
    * To make sure the URL in the metadata stays intact, set $keepinmind to change it back.
    */
    $keepinmind = $v['meta']['url'];
    array_walk_recursive($v, 'renderPageHtmlUrl', renderPageRelPathPrefix($v['meta']['url']));
    $v['meta']['url'] = $keepinmind;

    /*
    * Smarty template engine settings for this project
    */
    require_once($env['smarty_class_path_abs']);
    $smarty = new Smarty();
    $smarty->setTemplateDir($env['nonwww_dir_path_abs'].'/templates/'.$v['meta']['theme'].'/templates');
    $smarty->setCompileDir($env['nonwww_dir_path_abs'].'/templates/'.$v['meta']['theme'].'/templates_c');
    $smarty->setCacheDir($env['nonwww_dir_path_abs'].'/templates/'.$v['meta']['theme'].'/cache');
    $smarty->setConfigDir($env['nonwww_dir_path_abs'].'/templates/'.$v['meta']['theme'].'/configs');
    //$smarty->testInstall();
    
    /*
    * Now include the handler for this theme to compile the HTML
    */
    $page = $v;
    $page['relPathPrefix'] = renderPageRelPathPrefix($v['meta']['url']);
    include($themehandlerpath);
    return $html;
}

/*************************************
*
*/
function getUserProject($json) {
    global $env;
    global $tempsession;
    // convert JSON to array
    $v = json_decode($json, true);
    // minimum check: user sent?
    if(!isset($v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user not set"}');
        return FALSE;
    }
    // minimum check: user exists?
    if(!file_exists($env['data_dir_path_abs']."/users/".$v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user does not exist"}');
        return FALSE;
    }
    // minimum check: user not empty?
    if(trim($v['user']) == "") {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user string empty"}');
        return FALSE;
    }
    return $tempsession['project'];
}

/*************************************
* Access rights
*/
function checkUserAccessProject($json) {
    global $env;
    // convert JSON to array
    $v = json_decode($json, true);
    // minimum check: user sent?
    if(!isset($v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user not set"}');
        return FALSE;
    }
    // minimum check: user exists?
    if(!file_exists($env['data_dir_path_abs']."/users/".$v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user does not exist"}');
        return FALSE;
    }
    // minimum check: user not empty?
    if(trim($v['user']) == "") {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user string empty"}');
        return FALSE;
    }
    // minimum check: project path sent?
    if(!isset($v['projectpath'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"project path not set"}');
        return FALSE;
    }
    // minimum check: project path exists?
    if(!file_exists($v['projectpath'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"project path does not exist"}');
        return FALSE;
    }
    // minimum check: project path not empty?
    if(trim($v['projectpath']) == "") {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"project path string empty"}');
        return FALSE;
    }
    return "not-implemented-yet";
}


/*************************************
* Authentication
*/
function getUserToken($json) {
    global $env;
    // convert JSON to array
    $v = json_decode($json, true);
    // minimum check: user sent?
    if(!isset($v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user not set"}');
        return FALSE;
    }
    // minimum check: user exists?
    if(!file_exists($env['data_dir_path_abs']."/users/".$v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user does not exist"}');
        return FALSE;
    }
    // minimum check: user not empty?
    if(trim($v['user']) == "") {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user string empty"}');
        return FALSE;
    }
    return "not-implemented-yet";
}
function checkUserToken($json) {
    global $env;
    /* not-implemented-yet */
    // convert JSON to array
    $v = json_decode($json, true);
    // minimum check: user and token sent?
    if(!isset($v['user']) || !isset($v['token'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user or token not set"}');
        return FALSE;
    } 
    // minimum check: user exists?
    if(!file_exists($env['data_dir_path_abs']."/users/".$v['user'])) {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user does not exist"}');
        return FALSE;
    }
    // minimum check: user not empty?
    if(trim($v['user']) == "") {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"user string empty"}');
        return FALSE;
    }
    // minimum check: token not empty?
    if(trim($v['token']) == "") {
        // write to log file
        logWrite('{"type":"ERROR","function":"'.__FUNCTION__.'","message":"token string empty"}');
        return FALSE;
    }
    return $v['token'];
}

/*************************************
* Logging
*/
function logWrite($json) {
    global $env;
    // convert JSON to array
    $v = json_decode($json, true);
    // only log events which are listed in config
    if (strpos($env['log_events'], $v['type']) !== false) {
        file_put_contents($env['logs_dir_path_abs']."/log.txt", $v['type']."||".date(DATE_RFC822)."||".$v['message']."||".$json."\n", FILE_APPEND | LOCK_EX);
    }
    return TRUE;
}
?>