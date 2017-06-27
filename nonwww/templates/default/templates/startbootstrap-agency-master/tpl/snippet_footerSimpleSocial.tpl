<!-- tpl/{$smarty.template} -->
    <footer {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'startbootstrap-agency-master/tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">{$e.content.text}</span>
                </div>
                <div class="col-md-4">
                        {if isset($e.content.socialIcons)}<ul class="list-inline social-buttons">
    {foreach $e.content.socialIcons as $icon => $url}
                            <li>
                                <a href="{$url}"><i class="fa fa-{$icon}"></i></a>
                            </li>
    {/foreach}
                        </ul>{/if}

                </div>
                <div class="col-md-4">
                        {if isset($e.content.links)}<ul class="list-inline quicklinks">
    {foreach $e.content.links as $linktext => $url}
                            <li>
                                <a href="{$url}">{$linktext}</a>
                            </li>
    {/foreach}
                        </ul>{/if}

                </div>
            </div>
        </div>
    </footer>
<!-- / tpl/{$smarty.template} -->