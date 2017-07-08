<?php

$smarty->assign('env',$env);
$smarty->assign('page',$page);

/*
* Start building HTML
*/
if(isset($page['meta']['template']) && trim($page['meta']['template']) != "") {
    $template = $page['meta']['template'];
    $html = $smarty->fetch('string:'.$template);
} else {
    $html = $smarty->fetch($page['meta']['theme'].'/index.tpl');
}

?>