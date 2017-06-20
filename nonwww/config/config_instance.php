<?php
/**
 * @package    Docmint
 * @link       https://github.com/Inkmap/Docmint
 * @author     Micz Flor https://github.com/MiczFlor
 * @copyright  2017 the authors
 * @version    20170512
 * @license    http://www.opensource.org/licenses/mit-license.html  MIT License
 */

$env['data_obscurity']      = "datasecretaj38ja998gjair8we";
$env['debug']               = "true";
$env['log_events']          = "SUCCESS, ERROR, CONTEXT, DEBUG"; // comma separated even types (ERROR, INFO, WARNING, SUCCESS, CONTEXT, DEBUG)

/* 
* URLs
*/
$env['url_curl']    = $env['url_root']."/curl.php";

/* 
* paths and libraries
*/
$env['root_path_abs']           = "/var/www/html/docmint";
$env['libs_dir_path_abs']       = $env['nonwww_dir_path_abs']."/libs";
$env['logs_dir_path_abs']       = $env['nonwww_dir_path_abs']."/logs";
$env['require_dir_path_abs']    = $env['nonwww_dir_path_abs']."/require";
$env['data_dir_path_abs']       = $env['nonwww_dir_path_abs']."/".$env['data_obscurity'];
$env['smarty_class_path_abs']   = $env['libs_dir_path_abs']."/vendor/smarty-3.1.31/libs/Smarty.class.php";
$env['spyc_class_path_abs']     = $env['libs_dir_path_abs']."/vendor/spyc-master/Spyc.php";

/*
* relative paths for web
*/
$env['bootstrap_dir_path_rel']  = 'vendor/bootstrap3/bootstrap-3.3.7';
$env['bootswatch_dir_path_rel'] = 'vendor/bootswatch/bootswatch-gh-pages';

?>