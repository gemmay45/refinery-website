<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-xs-12 col-md-10 col-lg-8 ml-auto mr-auto">
    <div class="d-sm-flex">
        <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
        <div class="col mt-5" style="margin-top:0 !important">
            <img src="/static-assets/images/refinery/home-1.webp" alt="" class="img-fluid lazyload" style="">
        </div>
        <div class="col mt-5" style="margin-top:0 !important">
            <img src="/static-assets/images/refinery/home-2.webp" alt="" class="img-fluid lazyload" style="">
        </div>
        <div class="col mt-5" style="margin-top:0 !important">
            <img src="/static-assets/images/refinery/home-3.webp" alt="" class="img-fluid lazyload" style="">
        </div>
        </#if>
    </div>
</div>
        
        <#if contentModel.logos_o?? &&contentModel.logos_o.item??>
                <#list contentModel.logos_o.item as logoItem>
                    <@crafter.a class="link card col" href="https://www.cathaypacific.com/en_HK/wellness/insurance.html?cxsource=WELLNESS_HOME_PARTNERS" role="link" tabindex="0" $field="logos_o" $index=logoItem?index>
                        <div class="cardLink" id="Cigna Healthcare0.5952917193555887" style="height: 196px;">
                            <@crafter.img $field="logos_o.image_s" $index=logoItem?index alt="" class="imageWithFallback" src="${logoItem.image_s}" />
                        </div>
                        <@crafter.p class="cardText" $field="logos_o.name_s" $index=logoItem?index>${logoItem.name_s}</@crafter.p>
                    </@crafter.a>
                </#list>
            </#if>