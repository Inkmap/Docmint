<!-- tpl/{$smarty.template} -->
    <!-- Portfolio Grid Section -->
    <section {if isset($e.meta.id)}id="{$e.meta.id}"{/if} class="bg-light-gray" {include 'tpl/snippet_styleSection.tpl'}>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">{$e.content.title}</h2>
                    <h3 class="section-subheading text-muted">{$e.content.subTitle}</h3>
                </div>
            </div>
            <div class="row">
{assign var="itemcounter" value=1}            
{foreach $e.content.items as $item}        
                <div class="col-md-4 col-sm-6 portfolio-item">
                    <a href="#portfolioModal{$itemcounter}" class="portfolio-link" data-toggle="modal" style="
                        background: url({$item.imgUrl}) no-repeat center center; 
                        -webkit-background-size: cover;
                        -moz-background-size: cover;
                        -o-background-size: cover;
                        background-size: cover;
                        height: 280px;
                    ">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        {*<img src="{$item.imgUrl}" class="img-responsive" alt="{if isset($item.imgText)}{$item.imgText}{/if}">*}
                    </a>
                    <div class="portfolio-caption">
                        <h4>{$item.title}</h4>
                        <p class="text-muted">{$item.subTitle}</p>
                    </div>
                </div>
{assign var="itemcounter" value=$itemcounter+1}
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
    
{assign var="itemcounter" value=1}            
{foreach $e.content.items as $item}  
    <!-- Portfolio Modal -->
    <div class="portfolio-modal modal fade" id="portfolioModal{$itemcounter}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2>{$item.title}</h2>
                                <p class="item-intro text-muted">{$item.subTitle}</p>
                                {if isset($item.text)}{$item.text}{/if}
                                <br clear="all"/>
                                <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{assign var="itemcounter" value=$itemcounter+1}
{/foreach}           

<!-- / tpl/{$smarty.template} -->