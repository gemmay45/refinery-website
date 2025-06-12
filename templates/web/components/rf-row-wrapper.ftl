<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row">
    <#if contentModel.components_o?? && contentModel.components_o.item??>
         <#--<@crafter.div class="" $model=ContentModel $field="components_o">-->
         <@crafter.forEach contentModel.components_o; listItem, index>
             <@crafter.section class="section" $field="components_o" $index=index>
                <@renderComponent component=listItem/>
             </@crafter.section>
         </@crafter.forEach>
         <#--</@crafter.div>-->
     <#else>
         <@crafter.div class="craftercms-empty-collection" $model=ContentModel $field="components_o"></@crafter.div>
     </#if>
</div>