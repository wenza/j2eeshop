var PriceTaxCalculator = function () {
    var decimals = 2;
    var updatePriceWithoutTax = function(el){
        //el.val(parseFloat(el.val()).toFixed(decimals));
        if(el.length) {
            var value = el.val().replace(/ /g, '').replace(/,/g, '.');
            var name = el.attr('name');
            var priceName = name.substring(0, name.length - ('-without-tax').length);

            var taxEl = $('select[name="' + priceName + '-tax-id"]');
            var taxRate = taxEl.find(':selected').data('rate');
            var taxRate100 = taxRate / 100;
            var divider = (1 + taxRate100);
            var result = (value * divider).toFixed(decimals);


            console.log(priceName + '=' + result);
            $('.' + priceName).val(result);
            $('[name="' + priceName + '"]').val(result);
            updateProfit(priceName);
        }
    }
    var updatePriceWithTax = function(el){
        //el.val(parseFloat(el.val()).toFixed(decimals));
        if(el.length) {
            console.log(el.val());
            var value = el.val().replace(/ /g, '').replace(/,/g, '.');
            var name = el.attr('name');
            var taxEl = $('select[name="' + name + '-tax-id"]');
            var taxRate = taxEl.find(':selected').data('rate');
            var taxRate100 = taxRate / 100;
            var divider = (1 + taxRate100);
            var result = (value / divider).toFixed(decimals);
            $('.' + name + '-without-tax').val(result);
            $('[name="' + name + '-without-tax"]').val(result);
            updateProfit(name);
        }
    }
    var updatePriceByTax = function(el){
        if(el.length) {
            var priceName = el.attr('name');
            priceName = priceName.substring(0, priceName.length - ('-tax-id').length);
            var price = $('input[name="' + priceName + '"]');
            console.log('updating');
            updatePriceWithTax(price);
        }
    }
    var updateProfit = function(priceName){
        /*var price = $('input[name="'+priceName+'"]').val();
        var supplierPrice = $('input[name="supplier-'+priceName+'"]').val();
        var profit = (price-supplierPrice).toFixed(decimals);
        console.log('updating progit='+profit+' at '+'.'+priceName+'-profit-rate-with-tax');
        $('.'+priceName+'-profit-rate-with-tax').val(profit);
        $('input[name="'+priceName+'-profit-rate-with-tax"]').val(profit);*/
    }
    var handle = function(decimalsX) {
        decimals = decimalsX;
        updatePriceWithTax($('input[name="price"]'));
        $('input[name="price"]').keyup(function() {
            updatePriceWithTax($(this));
        });
        $('input[name="price-without-tax"]').keyup(function() {
            updatePriceWithoutTax($(this));
        });
        $( 'select[name="price-tax-id"]' ).change(function() {
            updatePriceByTax($(this));
        });

        updatePriceWithTax($('input[name="supplier-price"]'));
        $('input[name="supplier-price"]').keyup(function() {
            updatePriceWithTax($(this));
        });
        $('input[name="supplier-price-without-tax"]').keyup(function() {
            updatePriceWithoutTax($(this));
        });
        $( 'select[name="supplier-price-tax-id"]' ).change(function() {
            updatePriceByTax($(this));
        });

    }
    return {
        //main function to initiate the module
        init: function (decimalsX) {
            handle(decimalsX);
        }
    };
}();