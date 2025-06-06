<#import "/templates/system/common/crafter.ftl" as crafter />
<#include "/templates/web/fragments/constant.ftl"/>

<#macro renderSectionItems secItem>
     <#if secItem.components_o?? && secItem.components_o.item??>
         <@crafter.div class="" $model=ContentModel $field="components_o">
         <@crafter.forEach secItem.components_o; listItem, index>
             <@crafter.section class="section" $field="components_o" $index=index>
                <@renderComponent component=listItem/>
             </@crafter.section>
         </@crafter.forEach>
         </@crafter.div>
     <#else>
         <@crafter.div class="craftercms-empty-collection" $model=ContentModel $field="components_o"></@crafter.div>
     </#if>
</#macro>


<#macro renderHomepageSectionItems secItem>
     <div class="container-fluid">
     <#if secItem.topFluidComponents_o?? && secItem.topFluidComponents_o.item??>
         <@crafter.div class="" $model=ContentModel $field="topFluidComponents_o">
         <@crafter.forEach secItem.topFluidComponents_o; listItem, index>
             <#--<@crafter.section class="section" $field="topFluidComponents_o" $index=index>-->
                <@renderComponent component=listItem/>
             <#--</@crafter.section>-->
         </@crafter.forEach>
         </@crafter.div>
     <#else>
         <@crafter.div class="craftercms-empty-collection" $model=ContentModel $field="topFluidComponents_o"></@crafter.div>
     </#if>
     </div>
     <div class="container" id="main-content">
     <#if secItem.components_o?? && secItem.components_o.item??>
         <@crafter.div class="" $model=ContentModel $field="components_o">
         <@crafter.forEach secItem.components_o; listItem, index>
             <@crafter.section class="section" $field="components_o" $index=index>
                <@renderComponent component=listItem/>
             </@crafter.section>
         </@crafter.forEach>
         </@crafter.div>
     <#else>
         <@crafter.div class="craftercms-empty-collection" $model=ContentModel $field="components_o"></@crafter.div>
     </#if>
     </div>
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
