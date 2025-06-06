<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-12 lead-text">
    <@crafter.h2 class="title">${contentModel.title_s}</@crafter.h2>
    <@crafter.h3 class="subtitle">${contentModel.subtitle_s}</@crafter.h3>
    <@crafter.div>${contentModel.bodyContent_html}</@crafter.div>
</div>
