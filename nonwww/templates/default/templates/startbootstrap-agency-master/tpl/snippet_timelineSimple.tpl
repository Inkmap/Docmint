<!-- tpl/{$smarty.template} -->
    <!-- About Section -->
    <section  {if isset($e.meta.id)}id="{$e.meta.id}"{/if}>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading {include 'animatecss/snippet_customAnimateClass.tpl' customField='title'}">{$e.content.title}</h2>
                    <h3 class="section-subheading text-muted {include 'animatecss/snippet_customAnimateClass.tpl' customField='subTitle'}">{$e.content.subTitle}</h3>
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
                                {if isset($item.imgUrl)}
                                    <img class="img-circle img-responsive" src="{$item.imgUrl}" alt="{if isset($item.imgText)}{$item.imgText}{/if}">
                                {else}
                                    {if isset($item.imgText)}<h4>{$item.imgText}</h4>{/if}
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
            {if isset($e.content.text)}<br clear="all" /><div class="row" style="display: block;">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">{$e.content.text}</p>
                </div>
            </div>{/if}

        </div>
{if isset($e.buttons)}{include 'startbootstrap-agency-master/tpl/snippet_buttonsCentered.tpl'}{/if}        
    </section>
<!-- / tpl/{$smarty.template} -->