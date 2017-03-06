var GRIZZLYAPI = function () {
    var METHOD_TYPE_GET = 1;
    var METHOD_TYPE_POST = 2;
    var METHOD_TYPE_PUT = 3;
    var METHOD_TYPE_DELETE = 4;
    return {
        APIMessage : function (path, method, data) {
            var methodInt = method;
            if ("get" == method) methodInt = METHOD_TYPE_GET;
            if ("post" == method) methodInt = METHOD_TYPE_POST;//unused in servlet
            if ("put" == method) methodInt = METHOD_TYPE_PUT;
            if ("delete" == method) methodInt = METHOD_TYPE_DELETE;

            if(data==null){
                return {'path': path, 'method': methodInt};
            }else {
                return {'path': path, 'method': methodInt, 'data': data};
            }
        },
        testPutUserAddress : function(){
            GRIZZLYAPI.put('/user/1/address/',{'firstname':"Vaclav"});//api-tests
        },
        testPutCustomer : function(){
            GRIZZLYAPI.put('/customer/',{'firstname':"Vaclav"});//api-tests
        },
        post : function (path){
            GRIZZLYAPI.post(path,null)
        },
        post : function (path,data){
            var apiMessage = GRIZZLYAPI.APIMessage(path,METHOD_TYPE_POST,data);
            var urlX = '/api/v1';//"http://localhost:8080/lovelili_war_exploded/api/v1";
            $.ajax({
                url: urlX,
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(apiMessage),
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (responseData) {
                    GRIZZLYAPI.processSuccessData(responseData);
                    //$( ".result" ).html( counter+' | '+JSON.stringify(data)+'<br>'+$( ".result" ).html());
                },
                error:function(responseData,status,err) {
                    GRIZZLYAPI.processErrorData(responseData,status,err);
                }
            });
        },
        put : function (path,data){
            var apiMessage = GRIZZLYAPI.APIMessage(path,METHOD_TYPE_PUT,data);
            var urlX = '/api/v1';//"http://localhost:8080/lovelili_war_exploded/api/v1";
            $.ajax({
                url: urlX,
                type: 'POST',
                dataType: 'json',
                data: JSON.stringify(apiMessage),
                contentType: 'application/json',
                mimeType: 'application/json',
                success: function (responseData) {
                    GRIZZLYAPI.processSuccessData(responseData);
                    //$( ".result" ).html( counter+' | '+JSON.stringify(data)+'<br>'+$( ".result" ).html());
                },
                error:function(responseData,status,err) {
                    GRIZZLYAPI.processErrorData(responseData,status,err);
                }
            });
        },
        processErrorData : function(responseData,status,err){
            console.log("error: "+responseData+" status: "+status+" er:"+err);
        },
        processSuccessData : function(responseData){

        }
    };
    /*return {
        //main function to initiate the module
        init: function () {
            basketOperations();
        }
    };*/

}();