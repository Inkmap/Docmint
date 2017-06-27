<!-- tpl/{$smarty.template} -->
    <!-- Portfolio Grid Section -->
    <section {if isset($e.meta.id)}id="{$e.meta.id}"{/if} {include 'startbootstrap-agency-master/tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-push-2">
                    {if isset($e.content.title)}<h2 class="section-heading">{$e.content.title}</h2>{/if}
                    {if isset($e.content.subTitle)}<h3 class="section-subheading text-muted">{$e.content.subTitle}</h3>{/if}
                    {if isset($e.content.text)}<span class="text-xl">{$e.content.text}</span>{/if}
                    {if isset($e.content.blockquote)}<blockquote class="blockquote">
                          <p class="mb-0 text-xl">{$e.content.blockquote}</p>
                          {if isset($e.content.blockquoteSource)}<footer class="blockquote-footer text-xl">{$e.content.blockquoteSource}</footer>{/if}
                        </blockquote>
                    {/if}
                </div>
            </div>
        </div><!-- / container -->
    </section>
<!-- / tpl/{$smarty.template} -->