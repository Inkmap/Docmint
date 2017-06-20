<?php
/************************************************
* /LIST/PROJECTS
* 
* listing available projects accessible by user
*
* requires
* * $ses['user']
*
*/
logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"rest[1] == '.$rest[1].'","rest":"'.$ses['rest'].'"}');
$projectspath = $env['data_dir_path_abs']."/projects";

if(count(dir_list_dirs($projectspath)) == 0) {
    logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"No projects found","rest":"'.$ses['rest'].'"}');
} else {
    /*
    * Read files in pages directory 
    */
    $result = dir_list_dirs($projectspath);
    
    /*
    * Look for meta information inside project folder
    */
    $projectspaths = array();
    foreach($result as $projectpath) {
        /*
        * check if user is allowed to access project
        */
        if (checkUserAccessProject(json_encode(array("user"=>$ses['user'],"projectpath" => $projectspath)))) {
            $file_parts = pathinfo($projectpath);
            if(file_exists($projectpath."/projectinfo.yaml")) {
                /*
                * read YAML file to return project title as value (path as key)
                */
                $projectspaths[$projectpath] = $file_parts['basename'];
            } else {
                /*
                * return folder name as project title
                */
                $projectspaths[$projectpath] = $file_parts['basename'];
            }
        }
    }
    
    /*
    * Our work here is done, print the JSON and die.
    */
    print json_encode($projectspaths);
    logWrite('{"type":"SUCCESS","file":"'.__FILE__.'","message":"List of projects created and returned","rest":"'.$ses['rest'].'"}');
    die;
}
?>