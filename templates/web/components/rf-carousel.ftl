<#import "/templates/system/common/crafter.ftl" as crafter />


<div class="col-12">
    <div data-sliders="default" class="swiper-container mt-4 swiper-container-initialized swiper-container-horizontal"
        style="cursor: grab;">
        <div class="swiper-wrapper">
            <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>

                <#list contentModel.imageItems_o.item as imageItem>
                    <#assign cssClass = "swiper-slide swiper-slide-next" />
                    <#assign cssFirstClass = "swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" />
                    <#assign cssLodedClass = "swiper-lazy-preloader" />
                    <#assign cssPreloadedClass = "swiper-lazy-preloader" />
                    <#if imageItem?index == 0>
                        <#assign cssClass = "swiper-slide swiper-slide-active" />
                    <#else>
                        <#if imageItem?index == contentModel.imageItems_o.item?size-1>
                            <#assign cssClass = "swiper-slide swiper-slide-duplicate swiper-slide-prev swiper-slide-duplicate-next" />
                        <#else>
                            <#assign cssClass = "swiper-slide swiper-slide-next" />
                        </#if>
                    </#if>
                    <#--<#if imageItem?index == 0>
                        <#assign cssClass = "swiper-slide swiper-slide-active" />
                    <#else>
                        <#if imageItem?index == imageItems_o??size-1>
                            <#assign cssClass = "swiper-slide swiper-slide-duplicate swiper-slide-prev swiper-slide-duplicate-next" />
                            <#assign cssFirstClass = "swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" />
                        <#else>
                            <#assign cssClass = "swiper-slide swiper-slide-next" />
                        </#if>
                    </#if>-->
                    <@crafter.div class="swiper-slide" $index=imageItem?index style="width: 1110px;">
                            <div class="slider-title">${imageItem.title_s}</div>
                            <div data-ratio="111x55" class="img-box">
                                <@crafter.img src="${imageItem.image_s}" $field="imageItems_o.image_s" $index=imageItem?index alt="" class="swiper-lazy" />
                                <div class="swiper-lazy-preloader"></div>
                            </div>
                    </@crafter.div>
                 </#list>
            </#if>
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
