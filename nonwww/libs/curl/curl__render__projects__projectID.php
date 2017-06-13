<?php
/************************************************
* /RENDER/PROJECTS/projectID
* 
* rendering all pages of a project to HTML
*/
logWrite('{"type":"INFO","file":"'.__FILE__.'","message":"rest[1] == projects","rest":"'.$ses['rest'].'"}');
/*
* check if project ID submitted, else return error
*/
if(!isset($rest[2])) {
    /*
    * No project ID submitted throw error
    */
    logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"project not set for page rendering","rest":"'.$ses['rest'].'"}');
} else {
    $pagepath = $env['data_dir_path_abs']."/projects/".$rest[2];
    if(!file_exists($pagepath)) {
        logWrite('{"type":"ERROR","file":"'.__FILE__.'","message":"rest[2] project \''.$rest[2].'\' not found","rest":"'.$ses['rest'].'"}');
    } else {
        $ses['project'] = $rest[2];
        /*
        * List all pages within project and create HTML one by one 
        */
        $ses['rest'] = "list/pages";
        /*
        * POST via cURL to receive JSON with list, then decode to array
        */
        $pagespaths = json_decode(curl_post($env['url_curl'], $ses), true);
        /*
        * setting target folder for HTML
        */
        $ses['htmlTargetDir'] = $env['data_dir_path_abs']."/projects/".$ses['project']."/htdocs";
        // check integrity: path correct?
        if($ses['htmlTargetDir'] != realpath($ses['htmlTargetDir'])) {
            logWrite(
                json_encode(
                    array(
                        "type" => "ERROR",
                        "message" => "var htmlTargetDir ".$ses['htmlTargetDir']." empty, wrong or dir does not exist",
                        "file" => __FILE__,
                        "fileLine" => __LINE__,
                        "session" => $ses,
                    )
                )
            );
            die('{"type":"ERROR","message":"html target dir wrong"}');
        }

        /*
        /* along with each created page, we also need to copy the vendor files (css, js, etc.)
        */
        $pagesvendors = array();
        
        /*****************************************************
        * Looping through the pages and creating output
        */
            
        foreach($pagespaths as $pagepath => $pagetitle) {
            //echo "<h1>".$pagepath."</h1>";
            /*
            * read metadata of page content for file name and relative paths
            */
            $pageconfig = spyc_load_file($pagepath);
            
            /*
            * Check if we have a url in the metadata
            */
            if(!isset($pageconfig['meta']['url']) || trim($pageconfig['meta']['url']) == "" || trim($pageconfig['meta']['url'],"/") == "") {
                logWrite(
                    json_encode(
                        array(
                            "type" => "ERROR",
                            "message" => "page url not set in page metadata",
                            "file" => __FILE__,
                            "fileLine" => __LINE__,
                            "session" => $ses,
                        )
                    )
                );
                die('{"type":"ERROR","message":"page url wrong"}');
            } else {
                /*
                * force the page url for saving to do be free of leading or trailing slashes
                */
                $pageconfig['meta']['url'] = trim($pageconfig['meta']['url'], "/");
            }
        
            /*
            * Create REST endpoint for CURL
            */
            $file_parts = pathinfo($pagepath);
            $ses['rest'] = "render/pages/".$file_parts['filename'];
            
            /*
            * get the page content as HTML
            * Call the cURL page with a POST
            */
            $pagehtml = curl_post($env['url_curl'], $ses);
            
            /*
            * Writing page to htdocs folder
            * after creating folders, if necessary    
            */
            $pagedirs = explode("/", $pageconfig['meta']['url']);
            if(count($pagedirs) > 1) {
                /*
                * page will be nested, create subfolder if non-existent
                */ 
                $file_parts = pathinfo($pageconfig['meta']['url']);
                if (!file_exists($ses['htmlTargetDir']."/".$file_parts['dirname'])) {
                    mkdir($ses['htmlTargetDir']."/".$file_parts['dirname'], 0777, true); // 'true' => depth larger 1 
                }
            }
            file_put_contents($ses['htmlTargetDir']."/".$pageconfig['meta']['url'], $pagehtml);
            
            /*
            * add vendor folder to list of vendor stuff to copy (in the next step)
            * use key as vendor name to avoid duplicates
            */
            $pagesvendors[$pageconfig['meta']['theme']] = TRUE;
        }
        
        /******************************************************
        * VENDOR libraries
        */

        /*
        * add libraries used besides theme
        */
        $pagesvendors['animate.css-master'] = TRUE;
        $pagesvendors['jquery.inview.js'] = TRUE;
        $pagesvendors['jquery.waypoints.js'] = TRUE;
        
        /*
        * copy assets from vendor folder to htdocs folder
        */
        
        foreach($pagesvendors as $pagevendor => $bolean) {
            if (!file_exists($ses['htmlTargetDir']."/vendor/".$pagevendor)) {
                mkdir($ses['htmlTargetDir']."/vendor/".$pagevendor, 0777, true); // 'true' => depth larger 1 
            }
            $exec = "cp -R ".$env['root_path_abs']."/vendor/".$pagevendor."/* ".$ses['htmlTargetDir']."/vendor/".$pagevendor."/";
            exec($exec);
        }
        
        /*
        * copy folder with static content to htdocs
        */
        if(file_exists($env['data_dir_path_abs']."/projects/".$ses['project']."/static")) {
            $ses['htmlTargetDir'] = $env['data_dir_path_abs']."/projects/".$ses['project']."/htdocs";
            if (!file_exists($ses['htmlTargetDir']."/static")) {
                mkdir($ses['htmlTargetDir']."/static", 0777, true); // 'true' => depth larger 1 
            }
            $exec = "cp ".$env['data_dir_path_abs']."/projects/".$ses['project']."/static/* ".$ses['htmlTargetDir']."/static/";
            exec($exec);
        }
        /*
        * Our work here is done
        */
        $return = '{"type":"SUCCESS","file":"'.__FILE__.'","message":"Project pages passed on to page rendering","session":'.json_encode($ses).'}'; 
        logWrite($return);
        die($return);
    }
}
?>