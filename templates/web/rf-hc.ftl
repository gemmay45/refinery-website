<#import "/templates/system/common/crafter.ftl" as crafter />


            <@crafter.h5 class="underbar-short" $field="title_s">${contentModel.title_s}</@crafter.h5>
            <@crafter.div $field="bodyContent_html">${contentModel.bodyContent_html}</@crafter.div>
<#if contentModel.textRG_o?? && contentModel.textRG_o.item??>
<#list contentModel.textRG_o.item as textItem>
                                         ${textItem.text_s}
                                         <img src="${textItem.image_s}" />
</#list>
</#if>