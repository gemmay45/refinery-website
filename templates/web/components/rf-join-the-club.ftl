<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-12 lead-text light-on-dark">
    <@crafter.h2 class="title" $field="title_s">${contentModel.title_s}</@crafter.h2>
    <@crafter.div $field="bodyContent_html">${contentModel.bodyContent_html}</@crafter.div>
</div>
