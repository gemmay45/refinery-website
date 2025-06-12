<#import "/templates/system/common/crafter.ftl" as crafter />


            <@crafter.h5 class="underbar-short" $field="title_s">${contentModel.title_s}</@crafter.h5>
            <@crafter.div $field="bodyContent_html">${contentModel.bodyContent_html}</@crafter.div>
<#list contentModel.textRG_o.item as textItem>
                                         ${textItem.text_s}

                    </#list>