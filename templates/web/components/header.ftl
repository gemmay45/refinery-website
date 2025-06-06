<#import "/templates/system/common/crafter.ftl" as crafter />

<#--
<@crafter.header id="header">
  <a href="/" class="logo">
    <@crafter.img $field="logo_s,logo_text_t" src=(contentModel.logo_s!"") alt=(contentModel.logo_text_t!"") border=0 />
    <#if profile??>
      <#assign name = profile.attributes.name!"stranger" />
    <#else>
      <#assign name = "stranger" />
    </#if>
    Howdy, ${name}
  </a>
  <@crafter.renderComponentCollection $field="socialMediaWidget_o" />
</@crafter.header>
-->