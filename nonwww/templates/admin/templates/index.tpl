<!DOCTYPE html>
<html lang="en">
{include 'tpl/html_head.tpl'}
  <body class="bs3-fixed-navbar-top">
{include "tpl/navbartop.tpl"}  
    
    <div class="container">
{if isset($ses.user)}  

<ol class="breadcrumb">
  <li>Home</li>
  <li class="active">Login</li>
</ol>   
<h1>page</h1>
{if isset($message)}
<div class="alert alert-dismissible {$message.typeClass}">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  {$message.content}
</div>
{/if}  
{else}
    {include 'tpl/login-form.tpl'}
{/if}

{include 'tpl/html_javascript_links.tpl'}
{if $env.debug == "true"}
    {include 'tpl/debug-body.tpl'} 
    {*include 'test-bootstrap.tpl'*}
{/if}
  </body>
</html>