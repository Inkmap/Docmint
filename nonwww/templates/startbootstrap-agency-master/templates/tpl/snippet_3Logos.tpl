<!-- tpl/{$smarty.template} -->
    <!-- Clients Aside -->
    <aside {if isset($e.meta.id)}id="{$e.meta.id}"{/if} class="clients" {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">  
{foreach $e.content.items as $item}  
                <div class="col-md-4 col-sm-6">
                    <a href="#">
                        <img src="{$item.imgUrl}" class="img-responsive img-centered" alt="">
                    </a>
                </div>
{/foreach}
            </div>
            {if isset($e.content.text)}<div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">{$e.content.text}</p>
                </div>
            </div>{/if}

        </div>
{if isset($e.buttons)}{include 'tpl/snippet_buttonsCentered.tpl'}{/if}
    </aside>
<!-- / tpl/{$smarty.template} -->