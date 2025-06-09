<#import "/templates/system/common/crafter.ftl" as crafter />


<div class="col-12">
    <div data-sliders="default" class="swiper-container mt-4 swiper-container-initialized swiper-container-horizontal"
        style="cursor: grab;">
        <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-1110px, 0px, 0px);">
            <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
                <#list contentModel.imageItems_o.item as imageItem>
                    <@crafter.div class="swiper-slide swiper-slide-duplicate swiper-slide-prev swiper-slide-duplicate-next"
                $index=imageItem?index>
                        <div class="slider-title">SEMI-PRIVATE DINING</div>
                    <#--<@crafter.div class="col mt-5" style="margin-top:0 !important" $field="imageItems_o" $index=imageItem?index>-->
                        <div data-ratio="111x55" class="img-box">
                            <@crafter.img src="${imageItem.image_s}" alt="" class="img-fluid lazyload" style="" $field="imageItems_o.image_s" $index=imageItem?index />
                            <div class="swiper-lazy-preloader"></div>
                        </@crafter.div>
                    </@crafter.div>
                 </#list>
            </#if>

            <#--<div class="swiper-slide swiper-slide-duplicate swiper-slide-prev swiper-slide-duplicate-next"
                data-swiper-slide-index="1" style="width: 1110px;">
                <div class="slider-title">SEMI-PRIVATE DINING</div>
                <div data-ratio="111x55" class="img-box"><img
                        data-src="/static-assets/images/refinery/semi-private-dining_retouched-update_7-aug.webp"
                        alt="" class="swiper-lazy">
                    <div class="swiper-lazy-preloader"></div>
                </div>
            </div>
            <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="0" style="width: 1110px;">
                <div class="slider-title">MAIN DINING</div>
                <div data-ratio="111x55" class="img-box"><img alt="" class="swiper-lazy swiper-lazy-loaded"
                        src="/static-assets/images/refinery/main-dining-hero.webp"> </div>
            </div>
            <div class="swiper-slide swiper-slide-next swiper-slide-duplicate-prev" data-swiper-slide-index="1"
                style="width: 1110px;">
                <div class="slider-title">SEMI-PRIVATE DINING</div>
                <div data-ratio="111x55" class="img-box"><img
                        data-src="/static-assets/images/refinery/semi-private-dining_retouched-update_7-aug.webp"
                        alt="" class="swiper-lazy">
                    <div class="swiper-lazy-preloader"></div>
                </div>
            </div>
            <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="0"
                style="width: 1110px;">
                <div class="slider-title">MAIN DINING</div>
                <div data-ratio="111x55" class="img-box"><img alt="" class="swiper-lazy swiper-lazy-loaded"
                        src="/static-assets/images/refinery/main-dining-hero.webp"> </div>
            </div>
            -->
        </div>
        <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span
                class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button"
                aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet" tabindex="0" role="button"
                aria-label="Go to slide 2"></span></div>
        <div class="carousel-nav-button button-prev" tabindex="0" role="button" aria-label="Previous slide"><span
                class="icon sp-arrow-prev"></span> <span class="sr-only">Previous</span></div>
        <div class="carousel-nav-button button-next" tabindex="0" role="button" aria-label="Next slide"><span
                class="icon sp-arrow-next"></span> <span class="sr-only">Next</span></div><span
            class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
    </div>
</div>
