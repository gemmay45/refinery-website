<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row">
    <div class="col-12 lead-text">
    <#if contentModel.components_o?? && contentModel.components_o.item??>
         <@crafter.div class="" $model=ContentModel $field="components_o">
         <@crafter.forEach contentModel.components_o; listItem, index>
             <@crafter.section class="section" $field="components_o" $index=index>
                <@renderComponent component=listItem/>
             </@crafter.section>
         </@crafter.forEach>
         </@crafter.div>
     <#else>
         <@crafter.div class="craftercms-empty-collection" $model=ContentModel $field="components_o"></@crafter.div>
     </#if>
    </div>
    <div class="col-12 lead-text">
        <h2 class="title">CLUB FACILITIES</h2>
<h3 class="subtitle">AMENITIES MADE FOR PERSONAL AMBITION</h3>
<p><span>The Refinery presents our Members with a sense of belonging, through facilities fit for personal indulgence and shared gratification. Our array of amenities allows you to embrace life's many pleasures – culinary delights in our restaurant, mellow moments within our bar &amp; lounges, as well as physical accomplishments through our fitness centre.</span></p>


    </div>

</div>