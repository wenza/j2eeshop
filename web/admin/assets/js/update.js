var Update = function () {
    var interval = null;
    var updateUpdateState = function(){
        var container = $('.update-system-log');
        $.ajax({
            url: '/admin/ajax_updating_state.jsp',
            type: 'POST',
            //dataType: 'json',
            //data: JSON.stringify(apiMessage),
            contentType: 'application/json',
            mimeType: 'application/json',
            success: function (responseData) {
                console.log(responseData);
                if(responseData.is_updating){
                    container.html('');
                    for(var i in responseData.update_status){
                        var value = responseData.update_status[i];
                        container.append(value+'<br>');
                    }
                }else{
                    clearInterval(interval);
                    interval = null;
                    container.html('');
                    for(var i in responseData.update_status){
                        var value = responseData.update_status[i];
                        container.append(value+'<br>');
                    }
                }
            },
            error: function (responseData, status, err) {
                console.log('error');
                clearInterval(interval);
                interval = null;
                //GRIZZLYAPI.processErrorData(responseData,status,err);
            }
        });
    }
    var handle = function(){
        var updateSysBtn = $('button[name="update-system"]');
        updateSysBtn.click(function(){
            if(interval==null) {
                console.log('CLICKED');
                //var urlX = '/';//"http://localhost:8080/lovelili_war_exploded/api/v1";
                $.ajax({
                    url: '/admin/ajax_updating_start.jsp',
                    type: 'POST',
                    //dataType: 'json',
                    //data: JSON.stringify(apiMessage),
                    //contentType: 'application/json',
                    //mimeType: 'application/json',
                    success: function (responseData) {
                        updateUpdateState();
                        interval = setInterval(function () {
                            //code goes here that will be run every 5 seconds.
                            updateUpdateState();
                        }, 5000);
                    },
                    error: function (responseData, status, err) {
                        console.log('error');
                        //GRIZZLYAPI.processErrorData(responseData,status,err);
                    }
                });
            }

        });
    }

    return {
        //main function to initiate the module
        init: function () {
            handle();
        }
    };
}();
jQuery(document).ready(function() {
    Update.init(settings.decimals);
});