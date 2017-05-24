<!-- tpl/{$smarty.template} -->
    <!-- Header -->
    <header {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">{$e.content.subtitle}</div>
                <div class="intro-heading">{$e.content.title}</div>
{if isset($e.buttons)}{include 'tpl/snippet_buttonsCentered.tpl'}{/if}        
            </div>
        </div>
    </header>
<!-- / tpl/{$smarty.template} -->