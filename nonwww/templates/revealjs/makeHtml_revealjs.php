<?php

$smarty->assign('env',$env);
$smarty->assign('page',$page);

/*
* Start building HTML
*/
$html = $smarty->fetch('index.tpl');

?>