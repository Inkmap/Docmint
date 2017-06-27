<!-- tpl/{$smarty.template} -->
    <!-- Header -->
    <header {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'startbootstrap-agency-master/tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in {include 'animatecss/snippet_customAnimateClass.tpl' customField='subTitle'}" style=" {include 'animatecss/snippet_customAnimateStyle.tpl' customField='subTitle'}">{$e.content.subTitle}</div>
                <div class="intro-heading {include 'animatecss/snippet_customAnimateClass.tpl' customField='title'}" style=" {include 'animatecss/snippet_customAnimateStyle.tpl' customField='title'}">{$e.content.title}</div>
{if isset($e.buttons)}{include 'startbootstrap-agency-master/tpl/snippet_buttonsCentered.tpl'}{/if}
                    {*if isset($e.content.socialIcons)}<ul class="list-inline social-buttons {include 'animatecss/snippet_customAnimateClass.tpl' customField='buttons'}" style=" {include 'animatecss/snippet_customAnimateStyle.tpl' customField='buttons'}">
{foreach $e.content.socialIcons as $icon => $url}
                        <li>
                            <a href="{$url}"><i class="fa fa-{$icon}"></i></a>
                        </li>
{/foreach}
                    </ul>{/if*}      
            </div>
        </div>
    </header>  
<!-- / tpl/{$smarty.template} -->