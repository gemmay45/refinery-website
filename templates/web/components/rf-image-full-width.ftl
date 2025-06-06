<#import "/templates/system/common/crafter.ftl" as crafter />

    <div class="hero">
            <div class="lazy-wrap lazy-wrap-loaded" data-ratio="50x20">
                               <@crafter.img alt="" class="img-fluid lazyload" $field="mediaThumbnail_s" src="${contentModel.mediaThumbnail_s}" />
            </div>
        <@crafter.div class="intro">
            <@crafter.h1 class="title">${contentModel.mediaTitle_s}</@crafter.h1>
            <@crafter.div $field="mediaBody_html">${contentModel.mediaBody_html}</@crafter.div>
        </@crafter.div>
        <a href="https://www.refineryclub.com/en/#main-content" class="move-to-sect">
            <span class="icon sp-arrow-down"></span>
            <span class="sr-only">Main Content</span>
        </a>
    </div>