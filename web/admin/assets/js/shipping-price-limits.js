var ShippingPriceLimit = function () {

    var handleSample = function () {
        //remove
        $('.btn-id-rm').click(function(){
            $('#'+$(this).data('id-to-rm')).remove();
        });
        //add limit-price
        var shippingPriceLimitCountriesID = -9999;
        $('.add-shipping-price-limit-countries').click(function(){
            //IMPORTANT TO INITIALIZE FIRST jstree.js!
            var tbody = $('.tbody-add-shipping-price-limit-countries');

            var html = ''+
                '	<tr class="odd gradeX" id="countries-rm-'+shippingPriceLimitCountriesID+'">'+
                '		<td>'+
                '           <input name="shipping-price-limit-countries-field" value="shipping-price-limit-'+shippingPriceLimitCountriesID+'-countries" style="display:none;"/>'+
                '			<input name="shipping-price-limit-'+shippingPriceLimitCountriesID+'-countries" class="jcvd" style="display:none;" value="test">'+
                '			<div class="countries-checkbox-tree-special-baby-'+shippingPriceLimitCountriesID+' tree-demo border-default" style="border:none;padding:0px;"></div>'+
                '		</td>'+
                '		<td><div class="input-group"><input class="form-control" type="number" value="0" name="shipping-price-limit-'+shippingPriceLimitCountriesID+'-countries-price"><span class="input-group-addon">'+SHOP_SETTINGS.default_currency.iso_code+'</span></div></td>'+
                '		<td>'+
                '			<a class="btn btn-sm red btn-outline grey-salsa btn-id-rm-'+shippingPriceLimitCountriesID+'" data-id-to-rm="countries-rm-'+shippingPriceLimitCountriesID+'"><i class="fa fa-times"></i> Odebrat</a>'+
                '		</td>'+
                '	</tr>';
            tbody.prepend(html);
            var treeview = $('.countries-checkbox-tree-special-baby-'+shippingPriceLimitCountriesID);
            UITree.initCountriesTreeviewo(treeview,emptyCountriesJTree);
            $('.btn-id-rm-'+shippingPriceLimitCountriesID).click(function(){
                $('#'+$(this).data('id-to-rm')).remove();
            });
            shippingPriceLimitCountriesID++;
        });
    }


    return {
        //main function to initiate the module
        init: function () {
            handleSample();
        }

    };

}();

jQuery(document).ready(function() {
    ShippingPriceLimit.init();
});
