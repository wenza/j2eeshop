
/*$("#rev_slider_4_1").show().revolution({
    sliderLayout: "fullscreen",
    onHoverStop: "off",
    shuffle: "on",
    minHeight: '600',
    spinner: 'spinner2',
    fullScreenOffsetContainer: ".ba-navbar"
});*/

jQuery(document).ready(function() {
    var revapi4 = jQuery("#rev_slider_4_1").show().revolution({
        /*sliderType:"hero",*/
        sliderLayout:"fullscreen",
        onHoverStop: "off",
        shuffle:"on",
        minHeight: '600',
        spinner: 'spinner2',
        fullScreenOffsetContainer: ".ba-navbar",
        responsiveLevels:[1240,1024,778,480],
        /*visibilityLevels:[1240,1024,778,480],*/
        gridwidth:[1240,1024,778,480],
        gridheight:[868,768,960,720],
        autoHeight:"off",
        fullScreenAutoWidth:"off",
        fullScreenAlignForce:"off",
        fullScreenOffset: ""
    });
});