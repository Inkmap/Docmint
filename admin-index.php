<?php

/* 
* read config files and then autoload configs, libs, classes and functions
*/
require_once('config.php');
require_once($env['nonwww_dir_path_abs'].'/config/autoload.php');

/*
* collect what we know about this user in our session array (from config.php in root)
*/
$ses['user'] = $tempsession['user']; // this value is taken from $env['nonwww_dir_path_abs'].'/config/config_temp.php' inside autoload.php

/*************************************************
* VALIDATE USER
* getting a token for the cURL process
*/
$ses['token'] = getUserToken('{"user":"'.$ses['user'].'"}');
/*
* Check user token to see if this call is valid
*/
if(!checkUserToken('{"user":"'.$ses['user'].'","token":"'.$ses['token'].'"}')) {
    logWrite(
        json_encode(
            array(
                "type" => "ERROR",
                "message" => "user token did not validate",
                "file" => __FILE__,
                "fileLine" => __LINE__,
                "session" => $ses,
            )
        )
    );
    die('{"type":"ERROR","message":"invalid token"}');
}

/*
* collect what we know about this user in our session array (from config.php in root)
*/
//$ses['project'] = getUserProject('{"user":"'.$ses['user'].'"}');

/*
* Variables we need to know for this session
*/
$env['project_dir_path_abs']    = $env['data_dir_path_abs']."/projects/".$ses['project'];
$env['org_dir_path_abs']        = $env['data_dir_path_abs']."/orgs/".$ses['org'];
$env['dpt_dir_path_abs']        = $env['data_dir_path_abs']."/dpts/".$ses['dpt'];
$env['team_dir_path_abs']       = $env['data_dir_path_abs']."/teams/".$ses['team'];
$env['user_dir_path_abs']       = $env['data_dir_path_abs']."/users/".$ses['user'];

/*
if(file_exists('misc/create-restapi-json.php')) {
    include('misc/create-restapi-json.php');
}
/**/

/*
* Project related variables we need to know for this session
*/
$env['smarty_dir_templates']    = $env['nonwww_dir_path_abs'].'/templates/admin/templates';
$env['smarty_dir_configs']      = $env['nonwww_dir_path_abs'].'/templates/admin/configs ';
$env['smarty_dir_cache']        = $env['nonwww_dir_path_abs'].'/templates/admin/cache';
$env['smarty_dir_compiled']     = $env['nonwww_dir_path_abs'].'/templates/admin/templates_c';

/*
* print what we got so far
*
print "<pre>\$page\n"; print_r($page); print "</pre>";
print "<pre>\$env\n"; print_r($env); print "</pre>";
print "<pre>\$ins\n"; print_r($ins); print "</pre>";
print "<pre>\$ses\n"; print_r($ses); print "</pre>";
/**/


/******************************************************************
* PREPARE TO DISPLAY
*/

/*
* Compile array for navigation items
*/
$nav = array(
    "title" => "DOCMINT",
);
/*
* pulldown RENDER: projects to render
*/
$ses['rest'] = "/list/projects";
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
* Read the $_GET variables
*/
if(isset($_GET['rest'])) {
    $ses['rest'] = $_GET['rest'];
}

/*
* POST via cURL to receive JSON with list, then decode to array
*/
$response = json_decode(curl_post($env['url_curl'], $ses), true);
print "<pre>"; print_r($ses); print "</pre>";//???

/******************************************************************
* START CREATING THE PAGE
*/

/*
* Smarty template engine settings for this project
*/
$smarty = new Smarty();
$smarty->setTemplateDir($env['smarty_dir_templates']);
$smarty->setCompileDir($env['smarty_dir_compiled']);
$smarty->setCacheDir($env['smarty_dir_cache']);
$smarty->setConfigDir($env['smarty_dir_configs']);
//$smarty->testInstall();
/**/
if(isset($response)) {
    $smarty->assign('response',$response);
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
//$smarty->assign('bootswatch',"united");

//$smarty->display('reveal/test_reveal.tpl');

$html = $smarty->fetch('index.tpl');

print $html;
/**/



?>