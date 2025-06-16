<#import "/templates/system/common/crafter.ftl" as crafter />
<#import "/templates/web/fragments/macro.ftl" as macro />

<@macro.renderHeaderItems contentModel />
<div id="content">
<@macro.renderHomepageSectionItems contentModel />

<div id="content-area">
          </div>
        <script>
          // JavaScript code to make AJAX call
          fetch('/studio/api/2/users/me/sites/refinery-website/roles')
            .then(response => response.json())
            .then(data => {
              // Update the page with the data
              document.getElementById('content-area').innerHTML = data.content;
            });
        </script>
        
</div>
<@macro.renderFooterItems contentModel />
