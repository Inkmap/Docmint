<?php
session_start();
/* 
* read config files and then autoload configs, libs, classes and functions
*/
require_once('config.php');
require_once($env['nonwww_dir_path_abs'].'/config/autoload.php');

/*
* Smarty template engine
*/
$env['smarty_dir_templates']    = $env['nonwww_dir_path_abs'].'/templates/admin/templates';
$env['smarty_dir_configs']      = $env['nonwww_dir_path_abs'].'/templates/admin/configs ';
$env['smarty_dir_cache']        = $env['nonwww_dir_path_abs'].'/templates/admin/cache';
$env['smarty_dir_compiled']     = $env['nonwww_dir_path_abs'].'/templates/admin/templates_c';
/*
* Smarty template engine settings for this project
*/
$smarty = new Smarty();
$smarty->setTemplateDir($env['smarty_dir_templates']);
$smarty->setCompileDir($env['smarty_dir_compiled']);
$smarty->setCacheDir($env['smarty_dir_cache']);
$smarty->setConfigDir($env['smarty_dir_configs']);
//$smarty->testInstall();

/**********************************************
/**********************************************
/**********************************************
* do we create a new or have a valid token?
*/
/*
* keep "login allowed" in mind that we attempt a login for error check later
*/
$validuser = "true";

/*
* First: did someone just attempt to log in?
*/
if(isset($_GET['action']) && $_GET['action'] == "login") {
    /*
    * check if user and password are correct
    */
    if(isset($_POST['usrnm'])) {
        /*
        * create session array
        */
        $ses = array();
        $ses['user'] = trim($_POST['usrnm']);
    }
    if(isset($_POST['psswd'])) {
        $pass = trim($_POST['psswd']);
        if (checkUserPassword('{"user":"'.$ses['user'].'","pass":"'.$pass.'"}')) {
            /*
            * getting a token to see if user is valid
            */
            $ses['token'] = getUserToken('{"user":"'.$ses['user'].'"}');
            // TODO: check if returns FALSE, then error and die
        } else {
            $validuser = "false";
        }
    }
} else {
    /*
    * no login attempt, we checked that
    * so see if we have a valid token
    */
    if(isset($_POST['token'])) {
    } elseif(isset($_GET['rest'])) {
        /*
        * token passed as first statement in rest string
        */
        /*
        * get token from rest string
        * 
        * Note: trim leading or trailing slashes
        */
        $ses['rest'] = trim($_GET['rest'],"/");
        /*
        * $rest is array of rest params
        */
        $rest = explode("/", $ses['rest']);
        $tokensent = $rest[0];
        /*
        * validate and get new token
        */
        $ses['token'] = checkValidToken('{"token":"'.$tokensent.'"}');
        /*
        * returns FALSE when failing
        */
        if(trim($ses['token']) == "") {
            $message = array(
                "type" => "ERROR",
                "typeClass" => "alert-danger",
                "content" => "Could not validate token"
            );
            $validuser = "false";
        } else {
            /*
            * read user ID from token
            */
            $ses['user'] = getUserFromToken('{"token":"'.$ses['token'].'"}');
            /*
            * returns FALSE when failing
            */
            if(trim($ses['user']) == "") {
                $message = array(
                    "type" => "ERROR",
                    "typeClass" => "alert-danger",
                    "content" => "No valid user found"
                );
                $validuser = "false";
            }
        }
        /* 
        * reassemble rest string without token
        */
        unset($rest[0]);
        $REST = implode("/", $rest);   
    }
}
/*
* do we have a token?
*/
if (!isset($validuser) || $validuser == "false") {
    /*
    * LOGIN SCREEN
    */
    unset($ses['user']);
    unset($ses['token']);
    if(!isset($message)) {
        $message = array(
            "type" => "ERROR",
            "typeClass" => "alert-danger",
            "content" => "Invalid login attempt"
        );
    }
} else {
    
    $userdatapath = $env['data_dir_path_abs']."/users/".$ses['user']."/userdata.yaml";
    
    /*
    * Compile array for navigation items
    */
    $nav = array();
    /*
    * pulldown RENDER: projects to render
    */
    $ses['rest'] = "/list/projects";
//    print "<pre>"; print "\nuserdatapath: ".$userdatapath."\n"; print_r($ses); print_r($env); print_r($_POST); print "</pre>";//???
    $navprojects = json_decode(curl_post($env['url_curl'], $ses), true);
    $nav['render'] = array(
        "title" => "Render",
        "content" => array(),
    );
    foreach($navprojects as $projectpath => $projectfolder) {
        $nav['render']['content'][$projectfolder] = "/render/projects/".$projectfolder;
    }
    /******************************************************************
    * DO WE NEED TO DO ANYTHING VIA REST?
    */
    
    /*
    * Read the $_GET variable for "things to do"
    */
    if(isset($_GET['rest'])) {
        $ses['rest'] = $REST;
    } else {
        /*
        * did we get any rest command via $_POST?
        */
    }
    
    /*
    * POST via cURL to receive JSON with list, then decode to array
    */
    $response = json_decode(curl_post($env['url_curl'], $ses), true);
} 

/*
* collect what we know about this user in our session array (from config.php in root)
*/
//$ses['user'] = $tempsession['user']; // this value is taken from $env['nonwww_dir_path_abs'].'/config/config_temp.php' inside autoload.php


/******************************************************************
* PREPARE TO DISPLAY
*/

//print "<pre>"; print_r($ses); print_r($_SESSION); print_r($_POST); print "</pre>";//???

/******************************************************************
* START CREATING THE PAGE
*/

if(isset($response)) {
    $smarty->assign('response',$response);
}
if(isset($message)) {
    $smarty->assign('message',$message);
}
if(isset($env)) {
    $smarty->assign('env',$env);
}
if(isset($project)) {
    $smarty->assign('project',$project);
}
if(isset($ses)) {
    $smarty->assign('ses',$ses);
}
if(isset($page)) {
    $smarty->assign('page',$page);
}
if(isset($nav)) {
    $smarty->assign('nav',$nav);
}

$html = $smarty->fetch('index.tpl');

print $html;
/**/



?>