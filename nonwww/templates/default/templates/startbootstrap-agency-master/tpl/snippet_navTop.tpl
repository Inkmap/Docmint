<!-- tpl/{$smarty.template} -->
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">{$page.meta.titleNav}</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">               
{$page.meta|print_r}
{if isset($page.meta.languages)}
{foreach $page.meta.languages as $language}
{if $language@first}
                    <li class="dropdown">
                        <a href="{$language.url}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{$language.title} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
{else}
                            <li><a href="{$language.url}">{$language.title}</a></li>       
{/if}
{if $language@last}
                        </ul>
                    </li>
{/if}
{/foreach}
{/if}             
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
{foreach $navlinks as $navid => $navtext}  
                    <li>
                        <a class="page-scroll" href="#{$navid}">{$navtext}</a>
                    </li>
{/foreach}                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
<!-- / tpl/{$smarty.template} -->