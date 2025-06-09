<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row cards without-shadow d-sm-flex mb-5">
    <#if contentModel.cardItems_o?? &&contentModel.cardItems_o.item??>
        <#list contentModel.cardItems_o.item as cardItem>
            <@crafter.div class="col-12 col-md-6 d-sm-flex mb-4" $field="cardItems_o" $index=cardItem?index>
                    <div class="card" id=${cardItem.title_s?lower_case?replace(" ","-")}>
                            <div class="card-img">
                                <a href="https://www.refineryclub.com/en/main-dining/" class="cta">                            
                                    <div class="lazy-wrap lazy-wrap-loaded" data-ratio="16x6">
                                        <@crafter.img alt="" class="img-fluid lazyload" $field="cardItems_o.image_s" $index=cardItem?index src="${cardItem.image_s}" style="" />
                                    </div>
                                </a>                    
                            </div>
                        <div class="card-desc">
                            <@crafter.h5 $field="cardItems_o.title_s" $index=cardItem?index>${cardItem.title_s}</@crafter.h5>
                            <@crafter.p $field="cardItems_o.summary_t" $index=cardItem?index>${cardItem.summary_t}</@crafter.p>
                        </div>
                    </div>
            </@crafter.div>
        </#list>
    </#if>
</div>