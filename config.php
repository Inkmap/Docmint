<?php
/**
 * @package    Docmint
 * @link       https://github.com/Inkmap/Docmint
 * @author     Micz Flor https://github.com/MiczFlor
 * @copyright  2017 the authors
 * @version    20170512
 * @license    http://www.opensource.org/licenses/mit-license.html  MIT License
 */

/*
* General information about environment
* more config options in the config folder inside the 'nonwww' directory 
*/
$env = array(
    /* folder with libraries and data - should be moved outside of htdocs */
    "nonwww_dir_path_abs" => "/var/www/html/docmint/nonwww",
    /* URL to page root dir */
    "url_root" => "http://localhost/docmint"
);
/*
* Session information
* This array will be used for information such as user, token, team, project, etc.
*/
$ses = array();

?>