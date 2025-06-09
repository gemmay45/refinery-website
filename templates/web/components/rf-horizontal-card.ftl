<#import "/templates/system/common/crafter.ftl" as crafter />

<div class="dining-intro d-md-flex flex-md-row justify-content-md-start align-items-md-stretch d-lg-flex flex-lg-row justify-content-lg-start align-items-lg-stretch">
    <div class="slider-wrapper">
        <div data-sliders="inpage" class="swiper-container">
            <div class="swiper-wrapper">
                <#if contentModel.imageItems_o?? &&contentModel.imageItems_o.item??>
                    <#list contentModel.imageItems_o.item as imageItem>
                        <@crafter.div class="swiper-slide" $index=imageItem?index style="width: 710px;">
                                <div data-ratio="38x26" class="img-box">
                                    <@crafter.img src="${imageItem.image_s}" $field="imageItems_o.image_s" $index=imageItem?index alt="" class="swiper-lazy" />
                                    <div class="swiper-lazy-preloader"></div>
                                </div>
                        </@crafter.div>
                     </#list>
                </#if>
            </div>
            <div class="swiper-pagination></div>
            <div class="carousel-nav-button button-prev">
                <span class="icon sp-arrow-prev"></span>
                <span class="sr-only">Previous</span></div>
            <div class="carousel-nav-button button-next">
                <span class="icon sp-arrow-next"></span>
                <span class="sr-only">Next</span>
            </div>
        </div>
    </div>
    
    <#if contentModel.cTALinkItems_o?? &&contentModel.cTALinkItems_o.item??>
    <div class="info d-lg-flex flex-lg-column justify-content-lg-center align-items-lg-center">
        <div class="text-center">
            <h5 class="underbar-short">
                ${contentModel.title_s}
            </h5>
            <p>-
                <br> <strong>Opening Hours:</strong> <br>
                Monday to Saturday
                <br>
                (except Public Holidays)
                <br> <strong>Lunch:</strong> noon to 3pm
                <br> <strong>Dinner:</strong> 6pm to 10:30pm
                <br>
                -
                <br> <strong><em>Reservations are highly recommended</em></strong>
            </p>
            <div class="speciality"><strong>Offer:</strong> <br>
                Contemporary Chinese cuisine</div>
            <p>&nbsp;</p>
            <div class="btn-group dropdown-btn"><button type="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false" class="btn cta dropdown-toggle">
                    View Menu
                </button>
                <div class="dropdown-menu" style="">
                    <#if contentModel.cTALinkItems_o?? &&contentModel.cTALinkItems_o.item??>
                        <#list contentModel.cTALinkItems_o.item as linkItem>
                          <a href="/-/media/swire/refineryclub/dining/menus/chinese-a-la-carte-menu.ashx" target="_blank"
                                class="dropdown-item">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">
                                        A la carte Menu
                                    </font>
                                </font>
                            </a>
                        </#list>
                    <#--<a
                        href="/-/media/swire/refineryclub/dining/menus/chinese-a-la-carte-menu.ashx" target="_blank"
                        class="dropdown-item">
                        <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">
                                A la carte Menu
                            </font>
                        </font>
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/chinese-dim-sum-menu.ashx" target="_blank"
                        class="dropdown-item">
                        Dim Sum
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/tasting-menu.ashx" target="_blank"
                        class="dropdown-item">
                        Tasting Menu
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/breakfast-meeting-packages.ashx"
                        target="_blank" class="dropdown-item">
                        Breakfast Meeting Packages
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/meeting-packages.ashx" target="_blank"
                        class="dropdown-item">
                        Half Day Meeting Packages
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/banquet-set-lunch-menu.ashx" target="_blank"
                        class="dropdown-item">
                        Banquet Set Lunch
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/banquet-set-dinner-menu.ashx" target="_blank"
                        class="dropdown-item">
                        Banquet Set Dinner
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/office-catering-menu.ashx" target="_blank"
                        class="dropdown-item">
                        Office Catering
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/master-wine-list.ashx" target="_blank"
                        class="dropdown-item">
                        Master Wine list
                    </a> <a href="/-/media/swire/refineryclub/dining/menus/takeaway-menu.ashx" target="_blank"
                        class="dropdown-item">
                        Takeaway Menu
                    </a>-->
                        </#if>
                    </div>
            </div>
            <p></p>
        </div>
    </div>
</div>