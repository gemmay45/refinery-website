<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="col-xs-12 col-md-10 col-lg-8 ml-auto mr-auto">
    <div class="d-sm-flex">
        <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
            <#list contentModel.imageItems_o.item as imageItem>
                <div class="col mt-5" style="margin-top:0 !important">
                    <@crafter.img src="${imageItem.thumbnail_s}" alt="" class="img-fluid lazyload" style="" $field="imageItem.thumbnail_s" $index=imageItem?index />
                </div>
             </#list>
        </#if>
    </div>
</div>