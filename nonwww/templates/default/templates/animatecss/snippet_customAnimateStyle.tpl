{if isset($customField)}{strip}
    {if $customField == "title"}
        {if isset($e.meta.animate.titleDelay)}
            {include 'animatecss/snippet_customAnimateStyleValue.tpl' customKey='delay' customValue=$e.meta.animate.titleDelay}
        {/if}
        {if isset($e.meta.animate.titleDuration)} 
            {include 'animatecss/snippet_customAnimateStyleValue.tpl' customKey='duration' customValue=$e.meta.animate.titleDuration}
        {/if}
    {/if}
    {if $customField == "subTitle"}
        {if isset($e.meta.animate.subTitleDelay)} 
            {include 'animatecss/snippet_customAnimateStyleValue.tpl' customKey='delay' customValue=$e.meta.animate.subTitleDelay}
        {/if}
        {if isset($e.meta.animate.subTitleDuration)} 
            {include 'animatecss/snippet_customAnimateStyleValue.tpl' customKey='duration' customValue=$e.meta.animate.subTitleDuration}
        {/if}
    {/if}
    {if $customField == "buttons"}
        {if isset($e.meta.animate.buttonsDelay)} 
            {include 'animatecss/snippet_customAnimateStyleValue.tpl' customKey='delay' customValue=$e.meta.animate.buttonsDelay}
        {/if}
    {/if}
{/strip}{/if}