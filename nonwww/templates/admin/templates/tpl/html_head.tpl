<!-- tpl/{$smarty.template} -->
  <head>
    <meta charset="utf-8">
    <title>Bootstrap test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- custom bootswatch design -->
    <link rel="stylesheet" href="{$env.url_root}/assets/offline-themes/bootswatch_united_bootstrap.css" media="screen">
    <!-- Material Design Icons -->
    <link href="{$env.url_root}/vendor/MaterialDesign-Webfont-master/css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="{$env.url_root}/vendor/misc/html5shiv.min.js"></script>
      <script src="{$env.url_root}/vendor/misc/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        body.bs3-fixed-navbar-top {
            min-height: 2000px;
            padding-top: 70px;
        }
        a, a:hover, a:visited, a:active {
            outline: 0;
        }
    </style>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#login-modal').modal('show');
        });
    </script>
  </head>
<!-- / tpl/{$smarty.template} -->