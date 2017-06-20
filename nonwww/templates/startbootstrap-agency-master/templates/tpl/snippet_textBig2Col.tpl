<!-- tpl/{$smarty.template} -->
    <!-- Portfolio Grid Section -->
    <section {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
{if isset($e.content.title)}
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">{$e.content.title}</h2>
                    <h3 class="section-subheading text-muted">{$e.content.subTitle}</h3>
                </div>
            </div>
{/if}            
            <div class="row">
                <div class="col-md-5 col-md-push-1">
                    {if isset($e.content.leftCol.imgUrl)}<img src="{$e.content.leftCol.imgUrl}" class="img-responsive" alt="{if isset($e.content.leftCol.imgText)}{$e.content.leftCol.imgText}{/if}">{/if}
                    {if isset($e.content.leftCol.title)}<h2 class="section-heading">{$e.content.leftCol.title}</h2>{/if}
                    {if isset($e.content.leftCol.subTitle)}<h3 class="section-subheading text-muted">{$e.content.leftCol.subTitle}</h3>{/if}
                    {if isset($e.content.leftCol.text)}<span class="text-xl">{$e.content.leftCol.text}</span>{/if}
                    {if isset($e.content.leftCol.blockquote)}<blockquote class="blockquote">
                          <p class="mb-0 text-xl">{$e.content.leftCol.blockquote}</p>
                          {if isset($e.content.leftCol.blockquoteSource)}<footer class="blockquote-footer text-xl">{$e.content.leftCol.blockquoteSource}</footer>{/if}
                        </blockquote>
                    {/if}
                </div>
                <div class="col-md-5 col-md-push-1">
                    {if isset($e.content.rightCol.title)}<h2 class="section-heading">{$e.content.rightCol.title}</h2>{/if}
                    {if isset($e.content.rightCol.subTitle)}<h3 class="section-subheading text-muted">{$e.content.rightCol.subTitle}</h3>{/if}
                    {if isset($e.content.rightCol.text)}<span class="text-xl">{$e.content.rightCol.text}</span>{/if}
                    {if isset($e.content.rightCol.blockquote)}<blockquote class="blockquote">
                          <p class="mb-0 text-xl">{$e.content.rightCol.blockquote}</p>
                          {if isset($e.content.rightCol.blockquoteSource)}<footer class="blockquote-footer text-xl">{$e.content.rightCol.blockquoteSource}</footer>{/if}
                        </blockquote>
                    {/if}
                </div>
            </div>
        </div><!-- / container -->
    </section>
<!-- / tpl/{$smarty.template} -->