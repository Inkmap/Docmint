<!-- tpl/{$smarty.template} -->
        <br clear="all"/>      
        <div class="container {include 'tpl/snippet_customAnimateClass.tpl' customField='buttons'}" style=" {include 'tpl/snippet_customAnimateStyle.tpl' customField='buttons'}">
            <div class="row">
                <div class="col-lg-12 text-center">
                {foreach $e.buttons as $button}
                <a href="{$button.url}" class="page-scroll btn btn-xl">{$button.text}</a>&nbsp;
                {/foreach}
                </div>
            </div>
        </div>
<!-- / tpl/{$smarty.template} -->