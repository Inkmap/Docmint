<!-- tpl/{$smarty.template} -->
    <!-- Team Section -->
    <section {if isset($e.meta.id)}id="{$e.meta.id}"{/if} class="bg-light-gray" {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">{$e.content.title}</h2>
                    <h3 class="section-subheading text-muted">{$e.content.subTitle}</h3>
                </div>
            </div>
            <div class="row">         
{foreach $e.content.items as $item}  
                <div class="col-sm-3">
                    <div class="team-member">
                        <img src="{$item.imgUrl}" class="img-responsive img-circle" alt="{if isset($item.imgText)}{$item.imgText}{/if}">
                        <h4>{$item.title}</h4>
                        <p class="text-muted">{$item.subTitle}</p>
                        {if isset($item.socialIcons)}<ul class="list-inline social-buttons">
    {foreach $item.socialIcons as $icon => $url}
                            <li>
                                <a href="{$url}"><i class="fa fa-{$icon}"></i></a>
                            </li>
    {/foreach}
                        </ul>{/if}

                    </div>
                </div>
{/foreach}
            {if isset($e.content.text)}<div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">{$e.content.text}</p>
                </div>
            </div>{/if}

        </div>
{if isset($e.buttons)}{include 'tpl/snippet_buttonsCentered.tpl'}{/if}
    </section>
<!-- / tpl/{$smarty.template} -->