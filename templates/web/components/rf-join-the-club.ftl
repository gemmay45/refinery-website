<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="row">
    <@crafter.div class="col-12 lead-text light-on-dark">
            <@crafter.h2 class="title underbar" $field="title_s">${contentModel.title_s}</@crafter.h2>
            <#--<@crafter.div $field="bodyContent_html">${contentModel.bodyContent_html}</@crafter.div>-->
        <p>
            <a href="https://www.refineryclub.com/en/membership/membership-fee/" class="btn btn-large cta" target="|Custom">Join Us</a>                
        </p>
    </@crafter.div>
</div>
