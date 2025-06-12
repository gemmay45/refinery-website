<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-12 lead-text">
    <#if contentModel.title_s?hasContent>
        <@crafter.h2 class="title" $field="title_s">${contentModel.title_s}</@crafter.h2>
    </#if>
    <#if contentModel.subtitle_s?hasContent>
        <@crafter.h3 class="subtitle" $field="subtitle_s">${contentModel.subtitle_s}</@crafter.h3>
    </#if>
    <#if contentModel.bodyContent_html?hasContent>
        <@crafter.div $field="bodyContent_html">${contentModel.bodyContent_html}</@crafter.div>
    </#if>
</div>
