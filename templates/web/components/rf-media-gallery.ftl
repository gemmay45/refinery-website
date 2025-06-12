<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-xs-12 col-md-10 col-lg-8 ml-auto mr-auto">
    <div class="d-sm-flex">
        <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
            <@crafter.renderRepeatGroup $field="imageItems_o" 
            $containerTag="div"
            $containerAttributes={"class" : "col-12 }
            $itemTag="div"
            $itemAttributes={"class" : "col mt-5", "style": "margin-top:0 !important" };
            imageItem, index>
                <#if imageItem.thumbnail_s?hasContent>
                    <@crafter.img $field="imageItems_o.thumbnail_s" src="${imageItem.thumbnail_s}" $index=index class="img-fluid lazyload" alt="${imageItem.thumbnail_s_alt!}" />
    			</#if>          
            <#--<#list contentModel.imageItems_o.item as imageItem>
                <@crafter.div class="col mt-5" style="margin-top:0 !important" $field="imageItems_o" $index=imageItem?index>
                    <@crafter.img src="${imageItem.thumbnail_s}" alt="" class="img-fluid lazyload" style="" $field="imageItems_o.thumbnail_s" $index=imageItem?index />
                </@crafter.div>
             </#list>
             -->
             </@crafter.renderRepeatGroup>
        </#if>
    </div>
</div>