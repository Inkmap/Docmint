<!-- tpl/{$smarty.template} -->
<header {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'startbootstrap-agency-master/tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">  
                <div class="col-md-6 col-md-12">
                    <div class="intro-text">
<!-- 16:9 aspect ratio -->
<div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="{$e.content.videourl}"></iframe>
</div>
                <div class="intro-lead-in">{$e.content.subTitle}</div>
                <div class="intro-heading">{$e.content.title}</div>
{if isset($e.buttons)}{include 'startbootstrap-agency-master/tpl/snippet_buttonsCentered.tpl'}{/if}  
</div>
        </div>
        </div>
    </div>
    </header>
    
<!-- / tpl/{$smarty.template} -->