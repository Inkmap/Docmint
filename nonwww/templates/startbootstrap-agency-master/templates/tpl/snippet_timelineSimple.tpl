<!-- tpl/{$smarty.template} -->
    <!-- About Section -->
    <section  {if isset($e.meta.id)}id="{$e.meta.id}"{/if}>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">{$e.content.title}</h2>
                    <h3 class="section-subheading text-muted">{$e.content.subtitle}</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
{*iterate left and right with this counter*}
{assign var="itemalign" value="0"}                    
{foreach $e.content.items as $item}      
                        <li {if $itemalign % 2 == 0}class="timeline-inverted"{/if}>
                            <div class="timeline-image">
                                {if isset($item.imgurl)}
                                    <img class="img-circle img-responsive" src="{$item.imgurl}" alt="{if isset($item.imgtext)}{$item.imgtext}{/if}">
                                {else}
                                    {if isset($item.imgtext)}<h4>{$item.imgtext}</h4>{/if}
                                {/if}
                            </div>
                            {if isset($item.date) || isset($item.title) || isset($item.text)}
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    {if isset($item.date)}<h4>{$item.date}</h4>{/if}
                                    {if isset($item.title)}<h4 class="subheading">{$item.title}</h4>{/if}
                                </div>
                                {if isset($item.text)}<div class="timeline-body">
                                    <p class="text-muted">{$item.text}</p>
                                </div>{/if}

                            </div>
                            {/if}
                        </li>
{assign var="itemalign" value=$itemalign + 1}
{/foreach}
                    </ul>
                </div>
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