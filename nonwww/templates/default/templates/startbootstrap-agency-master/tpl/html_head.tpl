<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Micz Flor" >

    <title>{$page.meta.titleTag}</title>
<!--
{*$page|print_r*}
-->
{include 'startbootstrap-agency-master/tpl/html_head_meta_social.tpl'}

    <!-- Bootstrap Core CSS -->
    <link href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/{$page.meta.theme}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/{$page.meta.theme}/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/{$page.meta.theme}/css/agency.css" rel="stylesheet">
    <link href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/{$page.meta.theme}/css/timelineSimple.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

    <!-- Animate.css -->
    <link rel="stylesheet" href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/animate.css-master/animate.min.css">
    <style type="text/css">
    .btn { margin-bottom: 1em; }
    .text-l { font-size: 1.5em; }
    .text-xl { font-size: 2em; }
    .text-xxl { font-size: 3em; }
    body { font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif; }
    </style>
</head>
