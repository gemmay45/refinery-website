<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="container-fluid">
    <div class="hero">
            <div class="lazy-wrap lazy-wrap-loaded" data-ratio="50x20">
                    <img alt="" class="img-fluid lazyload" src="${contentModel.mediaThumbnail}" style="">
            </div>
        <div class="intro">
            <h1 class="title">${contentModel.mediaTitle_s}</h1>
            ${contentModel.mediaBody_html}
        </div>
        <a href="https://www.refineryclub.com/en/#main-content" class="move-to-sect">
            <span class="icon sp-arrow-down"></span>
            <span class="sr-only">Main Content</span>
        </a>
    </div>
</@crafter.div>