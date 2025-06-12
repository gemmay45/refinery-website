<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row">
    <div class="col-12">
        <div data-sliders="default" class="swiper-container">
            <#--<div class="swiper-wrapper">-->
                <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
                                <@crafter.renderRepeatGroup $field="imageItems_o" 
                    $containerTag="div"
                    $containerAttributes={"class" : "swiper-wrapper" }
                    $itemTag="div"
                    $itemAttributes={"class" : "swiper-slide"};
                    imageItem, index>
                    <@crafter.div $field="imageItems_o.title_s" $index=index class="slider-title">${imageItem.title_s}</@crafter.div>
                    <div data-ratio="111x55" class="img-box">
                        <@crafter.img src="${imageItem.image_s}" $field="imageItems_o.image_s" $index=index alt="" class="swiper-lazy" />
                        <div class="swiper-lazy-preloader"></div>
                    </div>

                <#--<#if imageItem.thumbnail_s?hasContent>
                    <@crafter.img $field="imageItems_o.thumbnail_s" src="${imageItem.thumbnail_s}" $index=index class="img-fluid lazyload" alt="${imageItem.thumbnail_s_alt!}" />
    			</#if>-->          
             </@crafter.renderRepeatGroup>

                    <#--<#list contentModel.imageItems_o.item as imageItem>
                        <@crafter.div class="swiper-slide" $index=imageItem?index style="">
                                <@crafter.div $field="imageItems_o.title_s" $index=imageItem?index class="slider-title">${imageItem.title_s}</@crafter.div>
                                <div data-ratio="111x55" class="img-box">
                                    <@crafter.img src="${imageItem.image_s}" $field="imageItems_o.image_s" $index=imageItem?index alt="" class="swiper-lazy" />
                                    <div class="swiper-lazy-preloader"></div>
                                </div>
                        </@crafter.div>
                     </#list>-->
                </#if>
            <#--</div>-->
            <div class="swiper-pagination"></div>
            <div class="carousel-nav-button button-prev">
                <span class="icon sp-arrow-prev"></span>
                <span class="sr-only">Previous</span>
            </div>
            <div class="carousel-nav-button button-next">
                <span class="icon sp-arrow-next"></span>
                <span class="sr-only">Next</span>
            </div>
        </div>
    </div>
</div>