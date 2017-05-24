<!-- tpl/{$smarty.template} -->
    <footer {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">{$e.content.text}</span>
                </div>
                <div class="col-md-4">
                        {if isset($e.content.socialicons)}<ul class="list-inline social-buttons">
    {foreach $e.content.socialicons as $icon => $url}
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