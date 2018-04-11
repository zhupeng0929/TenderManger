
layui.use(['layer', 'form'], function () {
    var form = layui.form();

    form.on('checkbox', function (data) {
        if (data.elem.checked)
        {
            $.post('/RelevanceManager/Assign', {
                type: $("#moduleType").val(),
                firstId: $('#firstId').val(),
                secIds: data.value
            }, function (json) {
                json = $.parseJSON(json);
                
            });
        }
        else
        {
            $.post('/RelevanceManager/UnAssign', {
                type: $("#moduleType").val(),
                firstId: $('#firstId').val(),
                secIds: data.value
            }, function (json) {
                json = $.parseJSON(json);
               
            });
        }
    });
});
 
