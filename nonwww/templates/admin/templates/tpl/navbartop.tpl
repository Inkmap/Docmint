
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{$env.url_root}"><span class="mdi mdi-shape-polygon-plus mdi-24px"></span> DOCMINT</a>
        </div>
{* ONLY IF USER IS LOGGED IN *}  
{if isset($nav)}     
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
{if isset($nav.render)}            
{foreach $nav.render.content as $project=>$rest}
{if $rest@first}
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{$nav.render.title} <span class="caret"></span></a>
              <ul class="dropdown-menu">
{/if}              
                <li><a href="?rest=/{$ses.token}{$rest}">{$project}</a></li>
{if $rest@last}
                {*<li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>*}
              </ul>
            </li>
{/if}            
{/foreach}            
{/if}       
          </ul><!-- / nav navbar-nav -->
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="mdi mdi-account"></span> Username <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
{/if}        
      </div>
    </nav>