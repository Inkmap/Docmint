<?php
/************************************************
* /RENDER/PAGES/pageID
*
* requires
* * $ses['project']
* 
* rendering a page to HTML
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
        logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[2] page \''.$rest[2].'\' not found","rest":"'.$ses['rest'].'"}');
    } else {
        /*
        * read project metadata
        */
        $projectpath = $env['data_dir_path_abs']."/projects/".$ses['project'];
        $projectdatapath = $projectpath."/projectdata.yaml";
        $projectdata = spyc_load_file($projectdatapath);
        if(!file_exists($projectdatapath)) { // '.json_encode($projectdata).'
            logWrite(
                json_encode(
                    array(
                        "type" => "DEBUG",
                        "message" => "project metadata ".$projectdatapath." does NOT exist",
                        "file" => __FILE__,
                        "fileLine" => __LINE__,
                        "session" => $ses,
                    )
                )
            );
        } else {
            /*
            logWrite(
                json_encode(
                    array(
                        "type" => "DEBUG",
                        "message" => "project metadata ".$projectdatapath." does exist",
                        "file" => __FILE__,
                        "fileLine" => __LINE__,
                        "projectdata" => $projectdata,
                        "session" => $ses,
                    )
                )
            );
            /**/
        }
        /*
        * Read page content 
        */
        $page = spyc_load_file($pagepath);
        /*
        * fill missing page information with metadata from the project (read earlier)
        */
        foreach($projectdata['meta'] as $key => $value) {
            if(!isset($page['meta'][$key])) {
                $page['meta'][$key] = $value;  
                /*              
                logWrite(
                    json_encode(
                        array(
                            "type" => "DEBUG",
                            "message" => "\$pageconfig['meta']['".$key."'] does not exist",
                            "file" => __FILE__,
                            "fileLine" => __LINE__,
                            "pageconfig.meta" => $page['meta'],
                        )
                    )
                );
                /**/
            }
        }
        /*
        * Our work here is done, print the HTML and die.
        */
        print renderPageHtml(json_encode($page));
        logWrite('{"type":"SUCCESS","file":"'.__FILE__.'","message":"Page content created and returned","rest":"'.$ses['rest'].'"}');
        die;
    }
}
?>