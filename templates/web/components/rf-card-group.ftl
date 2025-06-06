<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row cards without-shadow d-sm-flex mb-5">
    <#if contentModel.cardItems_o?? &&contentModel.cardItems_o.item??>
        <#list contentModel.cardItems_o.item as cardItem>
            <@crafter.div class="col-12 col-md-6 d-sm-flex mb-4" $field="cardItems_o" $index=cardItem?index>
                    <div class="card" id=${cardItem.title_s?lower_case}>
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

                                                        <#--
                                                        <#if contentModel.cardItems_o?? &&contentModel.cardItems_o.item??>
                                                        <#list contentModel.cardItems_o.item as cardItem>
                                                            <@crafter.div class="col-4 col-m-card-4 col-l-3" $field="cardItems_o" $index=cardItem?index>
                                                                <div class="basicCard -withColorHex" style="--card-bg-color: #F9F9F9; --ribbon-color-rgb: 135, 122, 92;">
                                                                    <span>
                                                                        <@crafter.div class="basicCard__image">
                                                                            <div class="responsiveImage -withRatio" style="--imageWidth: 450; --imageHeight: 450; --imageWidthMD: 450; --imageHeightMD: 450; --imageWidthLG: 450; --imageHeightLG: 450;">
                                                                                <div vid_id="1885">
                                                                                    <picture>
                                                                                        <source class="responsiveImage__img" media="(min-width: 905px)" srcset="${cardItem.badgeImage_s}">
                                                                                        <source class="responsiveImage__img" media="(min-width: 600px) and (max-width: 904.98px)" srcset="${cardItem.badgeImage_s}">
                                                                                        <@crafter.img $field="cardItems_o.badgeImage_s" $index=cardItem?index class="responsiveImage__img" style="margin-top:-105px;left:15%;width:70%" src="${cardItem.badgeImage_s}" alt="" />
                                                                                    </picture>
                                                                                </div>
                                                                            </div>
                                                                        </@crafter.div>
                                                                        <div class="basicCard__textbox" style="margin-top:-160px">
                                                                            <div>
                                                                                <div class="equal-height-JlocK" style="transition-duration: 0.25s; height: 170px;">
                                                                                    <div class="basicCardContent">
                                                                                        <div>
                                                                                            <@crafter.h4 $field="cardItems_o.cardTitle_s" $index=cardItem?index>${cardItem.cardTitle_s}</@crafter.h4>
                                                                                            <@crafter.div class="basicCardContent__description" $field="cardItems_o.cardDescription_html" $index=cardItem?index>
                                                                                                ${cardItem.cardDescription_html}
                                                                                            </@crafter.div>
                                                                                        </div><div></div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </span>
                                                                </div>
                                                            </@crafter.div>
                                                            
                                                        </#list>
                                                    </#if>
                                                    -->