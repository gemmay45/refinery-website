<#import "/templates/system/common/crafter.ftl" as crafter />

    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=XXX" height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
    <div class="helpers">
        <div class="helper xs"></div>
        <div class="helper sm"></div>
        <div class="helper md"></div>
        <div class="helper lg"></div>
        <div class="helper xl"></div>
    </div>
    <!--[if IE]><p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p><![endif]-->
    <div class="header"><div class="container-fluid needed" id="cookies-usage">
    <div class="container cookies-usage">
        <div class="text">
            This website uses cookies to ensure you get the best experience on our website.
<a rel="noopener noreferrer" href="https://www.swireproperties.com/en/data-privacy-and-security-policy.aspx" target="_blank">More info</a>
        </div>
        <a href="https://www.refineryclub.com/en/#cookies-usage" class="acknowledge">
            <i class="fa fa-times" aria-hidden="true"></i>
            <span class="sr-only">Close</span>
        </a>
    </div>
</div>
        <div class="container-fluid">
            <div class="row header-secondary">
                <div class="col"></div>
            </div>
            <div class="row header-primary">
                <div class="col">
                    <nav class="navbar navbar-expand-lg navbar-primary">
                        <a href="https://www.refineryclub.com/en/" class="navbar-brand"><img src="./Home - The Refinery_files/refinery-logo-text.svg" class="img-fluid logo-full" alt="refinery-logo-text"><img src="./Home - The Refinery_files/refinery-logo-helix.svg" class="img-fluid logo-small" alt="refinery-logo-helix"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsPrimary" aria-controls="navbarsPrimary" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon">
                                <i class="fa fa-bars open" aria-hidden="true"></i>
                                <i class="fa fa-times close" aria-hidden="true"></i>
                                <span class="sr-only">Menu</span>
                            </span>
                        </button>
                        


<div class="collapse navbar-collapse" id="navbarsPrimary">
    <ul class="navbar-nav">
            <li class="nav-item  submenu" data-submenu="#9EC4BB095C494140A8B1DA8C68CACC36">


                    <a class="nav-link " href="https://www.refineryclub.com/en/main-dining/" target="">
Dining                                            </a>

                    <i class="submenu-toggle fa fa-angle-down">
                        <span class="sr-only">Toggle Submenu</span>
                    </i>
                    
                    <#if contentModel.placeChildreninNav_b?? && contentModel.placeChildreninNav_b>

                        <#assign navTree = navTreeBuilder.getNavTree("/site/website/main-dining", 1, "")/>
                        <#assign navItems = navTree.subItems/>
    
                        <ul class="navbar-nav">
                        <#list navItems as navItem>
                            <#assign storeUrl = urlTransformationService.transform('renderUrlToStoreUrl', navItem.url) />
                            <#assign siteItem = siteItemService.getSiteItem(storeUrl) />
                            <#assign itemUrl = storeUrl?replace("site/website/","")?replace("/index.xml", "") />
                            
                            <#if siteItem["redirect-url"]??>
                                <#assign itemUrl = siteItem["redirect-url"] />
                            </#if>
                            
                            <li class="nav-item">
                                <a href="${itemUrl}" class="nav-link">${siteItem.navLabel}</a>
                            </li>
                        </#list>
                        </ul>
                    </#if>
            </li>
            <li class="nav-item  ">


                    <a class="nav-link " href="https://www.refineryclub.com/en/fitness/" target="">
Fitness                                            </a>

            </li>
            <li class="nav-item  ">


                    <a class="nav-link " href="https://www.refineryclub.com/en/events-and-news/" target="">
News And Events                                            </a>

            </li>
            <li class="nav-item  ">


                    <a class="nav-link " href="https://www.refineryclub.com/en/membership/" target="">
Membership                                            </a>

            </li>
            <li class="nav-item  submenu" data-submenu="#B120A5EC63D34673992966EE0FD0AF9E">


                    <a class="nav-link " href="https://www.refineryclub.com/en/about/" target="">
About                                            </a>

                    <i class="submenu-toggle fa fa-angle-down">
                        <span class="sr-only">Toggle Submenu</span>
                    </i>
            </li>
            <li class="nav-item  ">


                    <a class="nav-link " href="https://www.refineryclub.com/en/contact/" target="">
Contact                                            </a>

            </li>
            <li class="nav-item  ">


                    <a class="nav-link " href="https://www.refineryclub.com/en/sign-in/" target="">
Sign In                                            </a>

            </li>
            <li class="nav-item  ">


                    <a class="nav-link " href="https://my.matterport.com/show/?m=H11tvLjcKif&amp;f=0" target="_blank">
Virtual Tour                                            </a>

            </li>
    </ul>
</div>
            </nav>
            
                    <#if contentModel.placeChildreninNav_b?? && contentModel.placeChildreninNav_b>

                        <#assign navTree = navTreeBuilder.getNavTree("/site/website/main-dining", 1, "")/>
                        <#assign navItems = navTree.subItems/>
    
                        <nav id="xxx" class="navbar navbar-expand-lg navbar-submenu active">
                            <div class="collapse navbar-collapse justify-content-lg-center">
                                <ul class="navbar-nav">
                                <#list navItems as navItem>
                                    <#assign storeUrl = urlTransformationService.transform('renderUrlToStoreUrl', navItem.url) />
                                    <#assign siteItem = siteItemService.getSiteItem(storeUrl) />
                                    <#assign itemUrl = storeUrl?replace("site/website/","")?replace("/index.xml", "") />
                                    
                                    <#if siteItem["redirect-url"]??>
                                        <#assign itemUrl = siteItem["redirect-url"] />
                                    </#if>
                                    
                                    <li class="nav-item">
                                        <a href="${itemUrl}" class="nav-link">${siteItem.navLabel}</a>
                                    </li>
                                </#list>
                                </ul>
                            </div>
                        </nav>
                    </#if>
                    
                    <#if contentModel.submenu_o?? && contentModel.submenu_o.item??>
                        <#list contentModel.submenu_o.item as submenu>
                            <#assign menuLinkItem =  siteItemService.getSiteItem(submenu.key) />
                            <#assign url = menuLinkItem.storeUrl />
                            
                            <nav id="xxx" class="navbar navbar-expand-lg navbar-submenu active">
                            <div class="collapse navbar-collapse justify-content-lg-center">
                                <ul class="navbar-nav">
                                <#list menuLinkItem.linkItems_o.item as linkItem>
                                    <li class="nav-item">
                                        <a href="${linkItem.link.item.url?replace("site/website/","")?replace("/index.xml", "")}" class="nav-link">${linkItem.link.item.linkText}</a>
                                    </li>
                                </#list>
                                </ul>
                                </div>
                            </nav>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    
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