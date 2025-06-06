<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-xs-12 col-md-10 col-lg-8 ml-auto mr-auto">
    <div class="d-sm-flex">
        <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
            <#list contentModel.imageItems_o.item as imageItem>
                <@crafter.div class="col mt-5" style="margin-top:0 !important" $field="imageItems_o" $index=imageItem?index>
                    <@crafter.img src="${imageItems_o.thumbnail_s}" alt="" class="img-fluid lazyload" style="" $field="imageItem.thumbnail_s" $index=imageItem?index />
                </@crafter.div>
             </#list>
        </#if>
    </div>
</div>

