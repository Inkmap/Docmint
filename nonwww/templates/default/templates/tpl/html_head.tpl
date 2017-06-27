<!-- tpl/{$smarty.template} -->
  <head>
    <meta charset="utf-8">
    <title>Bootstrap test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
{if isset($project.meta.bootswatch)}
    <!-- custom bootswatch design -->
    <link rel="stylesheet" href="{$env.bootswatch_dir_path_rel}/{$project.meta.bootswatch}/bootstrap.min.css" media="screen">
{else}    
    <link rel="stylesheet" href="{$env.bootstrap_dir_path_rel}/dist/css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="{$env.bootstrap_dir_path_rel}/dist/css/bootstrap-theme.min.css" media="screen">
{/if}
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="vendor/misc/html5shiv.min.js"></script>
      <script src="vendor/misc/respond.min.js"></script>
    <![endif]-->
  </head>
<!-- / tpl/{$smarty.template} -->