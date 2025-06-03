<#import "/templates/system/common/crafter.ftl" as crafter />
<#include "/templates/web/fragments/constant.ftl"/>

<#macro renderSectionItems secItem>
     <#if secItem.sections_o?? && secItem.sections_o.item??>
         <@crafter.div class="" $model=ContentModel $field="sections_o">
         <@crafter.forEach secItem.sections_o; listItem, index>
             <@crafter.section class="section" $field="sections_o" $index=index>
                <@renderComponent component=listItem/>
             </@crafter.section>
         </@crafter.forEach>
         </@crafter.div>
     <#else>
         <@crafter.div class="craftercms-empty-collection" $model=ContentModel $field="sections_o"></@crafter.div>
     </#if>
</#macro>

<#macro renderHeaderItems HeaderItem>
<#if HeaderItem.header_o?? && HeaderItem.header_o.item??>
    <#include "/templates/web/components/header.ftl"/>
</#if>
</#macro>

<#macro renderFooterItems FooterItem>
<#if FooterItem.footer_o?? && FooterItem.footer_o.item??>
    <#include "/templates/web/components/footer.ftl"/>
</#if>
</#macro>
