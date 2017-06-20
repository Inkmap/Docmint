<?php

if($env['debug'] == "true") {
    error_reporting(E_ALL);
    ini_set("display_errors", 1);
}
require_once($env['nonwww_dir_path_abs'].'/config/config_instance.php');

/*
* now read user / session information (this is for dev and demo purposes only)
*/
require_once($env['nonwww_dir_path_abs'].'/config/config_temp.php');

/*
* read all functions
*/
require_once($env['libs_dir_path_abs'].'/functions.php');
require_once($env['libs_dir_path_abs'].'/PHP-kit-func.php');

/*
* loading required classes for reading config and templated output
*/
require_once($env['smarty_class_path_abs']);
require_once($env['spyc_class_path_abs']);

?>