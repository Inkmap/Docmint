<!-- tpl/{$smarty.template} -->
    <!-- Services Section -->
    <section {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">{$e.content.title}</h2>
                    <h3 class="section-subheading text-muted">{$e.content.subtitle}</h3>
                </div>
            </div>
            <div class="row text-center">
{foreach $e.content.items as $item}            
                <div class="col-md-3">
                    {if isset($item.icon)}<span class="fa-stack fa-4x">
                        <i class="fa fa-circle fa-stack-2x text-primary"></i>
                        <i class="fa fa-{$item.icon} fa-stack-1x fa-inverse"></i>
                    </span>{/if}

                    <h4 class="service-heading">{$item.title}</h4>
                    <p class="text-muted">{$item.text}</p>
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
    </section>
<!-- / tpl/{$smarty.template} -->