<?php
/************************************************
* /LIST/PAGES
*
* requires
* * $ses['project']
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
    $result = dir_list_files($pagespath);
    
    /*
    * only return YAML pages (.yaml)
    */
    $pagespaths = array();
    foreach($result as $pagepath) {
        $file_parts = pathinfo($pagepath);
        if(isset($file_parts['extension']) && $file_parts['extension'] == "yaml") {
            /*
            * read YAML file to return page title as value (path as key)
            */
            $pageconfig = spyc_load_file($pagepath);
            if(!isset($pageconfig['meta']['title']) || trim($pageconfig['meta']['title']) == "") {
                $pagespaths[$pagepath] = $file_parts['basename'];
            } else {
                $pagespaths[$pagepath] = $pageconfig['meta']['title'];
            }
        }
    }
    
    /*
    * Our work here is done, print the JSON and die.
    */
    print json_encode($pagespaths);
    logWrite('{"type":"SUCCESS","file":"'.__FILE__.'","message":"List of pages created and returned","rest":"'.$ses['rest'].'"}');
    die;
}
?>