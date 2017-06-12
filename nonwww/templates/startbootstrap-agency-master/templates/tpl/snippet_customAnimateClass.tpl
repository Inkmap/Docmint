{if isset($customField)}
    {if $customField == "title"}
        {if isset($e.meta.animate.title)} animated {$e.meta.animate.title} {/if}
    {/if}
    {if $customField == "subTitle"}
        {if isset($e.meta.animate.subTitle)} animated {$e.meta.animate.subTitle} {/if}
    {/if}
    {if $customField == "buttons"}
        {if isset($e.meta.animate.buttons)} animated {$e.meta.animate.buttons} {/if}
    {/if}
{/if}