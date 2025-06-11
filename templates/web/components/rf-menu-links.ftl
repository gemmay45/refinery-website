<#import "/templates/system/common/crafter.ftl" as crafter />
dddd
        <#if contentModel.link??>
            <p>
                <@crafter.a $field="link" href="${crafterCommon.pathToUrl('${contentModel.link.url}', '')}" class="btn btn-large cta" target="${contentModel.link.linkTarget}">${contentModel.link.linkText}</@crafter.a>
            </p>
        </#if>