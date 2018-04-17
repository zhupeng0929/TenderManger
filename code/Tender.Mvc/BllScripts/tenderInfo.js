$(function () {
    $('#Filedata').ace_file_input({
        no_file: 'No File ...',
        btn_choose: 'Choose',
        btn_change: 'Change',
        droppable: false,
        onchange: null,
        thumbnail: true, //| true | large
        //whitelist:'gif|png|jpg|jpeg',
        //blacklist:'exe|php'
        //onchange:''
        //
    });
    $('#Filedatavideo').ace_file_input({
        no_file: 'No File ...',
        btn_choose: 'Choose',
        btn_change: 'Change',
        droppable: false,
        onchange: null,
        thumbnail: true, //| true | large
        //whitelist: 'gif|png|jpg|jpeg',
        //blacklist: 'exe|php'
        //onchange:''
        //
    });
    //var demo1 = $('select[name="TenderUser"]').bootstrapDualListbox({ infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>' });
    //var container1 = demo1.bootstrapDualListbox('getContainer');
    //container1.find('.btn').addClass('btn-white btn-info btn-bold');
    $('#TenderUser').multiselect({
        enableFiltering: true,
        enableHTML: true,
        buttonClass: 'btn btn-white btn-primary',
        buttonWidth: '100%',
        nonSelectedText: '请选择参投人员', //默认展示文本
        selectAllText: '全选',  //全选文本
        includeSelectAllOption: true
    });

});

//grid列表模块
function MainGrid() {
    var url = '/TenderInfoManager/Load?parentId=';

    this.maingrid = $('#maingrid')
        .jqGrid({
            colModel: [
                {
                    name: 'Id',
                    index: 'Id',
                    hidden: true
                },
                {
                    name: 'Title',
                    label: '标题',
                    index: 'Title',
                    width: 100
                },
                {
                    name: 'Description',
                    label: '描述',
                    index: 'Description',
                    width: 100
                },
                {
                    name: 'StartTime',
                    index: 'StartTime',
                    label: '开始时间',
                    width: 100
                },
                {
                    name: 'EndTime',
                    index: 'EndTime',
                    label: '结束时间',
                    width: 100
                },
                {
                    name: 'Cycle',
                    index: 'Cycle',
                    label: '提货周期',
                    width: 100
                },
                {
                    name: 'State',
                    index: 'State',
                    hidden: true
                },
                {
                    name: 'StateDes',
                    label: '状态',
                    index: 'StateDes',
                    width: 50,
                    align: 'center',
                    formatter: function (cellvalue, options, rowObject) {
                        if (rowObject.State == 0) {
                            return '<span  class=\"label label-info arrowed\">' + rowObject.StateDes + '</span>';
                        } else if (rowObject.State == 1) {
                            return '<span  class=\"label label-success arrowed-in\">' + rowObject.StateDes + '</span>';
                        } else if (rowObject.State == 3) {
                            return '<span  class=\"label label-pink\">' + rowObject.StateDes + '</span>';
                        } else {
                            return '<span  class=\"label label-grey\">' + rowObject.StateDes + '</span>';
                        }
                    }
                },

                {
                    name: 'SelectUser',
                    index: 'SelectUser',
                    hidden: true
                },
                //{
                //    name: 'SecondUser',
                //    index: 'SecondUser',
                //    label: '第二开标人',
                //    width: 100
                //},
                {
                    name: 'CreateDate',
                    index: 'CreateDate',
                    label: '添加时间',
                    width: 100
                },
                {
                    name: 'CreateUser',
                    index: 'CreateUser',
                    hidden: true
                },
                {
                    name: '',
                    index: 'Tools',
                    label: '操作',
                    formatter: function (cellvalue, options, rowObject) {
                        var detail = "<button class='btn btn-sm btn-success' onclick='btn_detail(\"" + rowObject.Id + "\")'' title='详细信息' style='padding:0px 10px'>" + "<i class='ace-icon fa fa-print'></i>详细信息</button>";
                        return detail;
                    }, align: 'center', width: 80
                },
            ],
            url: url,
            datatype: "json",

            viewrecords: true,
            rowNum: 18,
            pager: "#grid-pager",
            altRows: true,
            height: 'auto',
            multiselect: false,
            multiboxonly: false,

            loadComplete: function () {
                var table = this;
                setTimeout(function () {
                    updatePagerIcons(table);
                },
                    0);
            }
        }).jqGrid('navGrid', "#grid-pager", {
            edit: false, add: false, del: false, refresh: false, search: false
        });

    this.reload = function (id) {
        this.maingrid.jqGrid("setGridParam", { url: url })
            .trigger("reloadGrid", [{ page: 1 }]);  //重载JQGrid

    };
};
MainGrid.prototype = new Grid();
var list = new MainGrid();

var vm = new Vue({
    el: '#editDlg',
});

//添加（编辑）对话框
var editDlg = function () {
    var update = false;
    var show = function () {
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            title: "用户管理", //不显示标题
            area: ['600px', '580px'], //宽高
            maxmin: true, //开启最大化最小化按钮
            content: $('#editDlg'), //捕获的元素
            btn: ['保存', '关闭'],
            yes: function (index, layero) {
                $("#editForm").ajaxSubmit(
                    {
                        type: 'POST',
                        url: '/TenderInfoManager/Add',
                        dataType: 'json',
                        data: vm.$data,
                        success: function (data) {
                            layer.msg(data.Message);
                            if (data.Status) {
                                layer.close(index);
                                list.reload();
                            }
                        }

                    }

                )

            },
            cancel: function (index) {
                layer.close(index);
            }
        });
    }
    return {
        add: function () {  //弹出添加
            update = false;
            show();
            vm.$set('$data',
                {
                    Id: '00000000-0000-0000-0000-000000000000',
                    isSelect: 'ok'
                });
            $('#TenderUser').multiselect('clearSelection');
            $(".remove").click();
        },
        update: function (ret) {  //弹出编辑框
            update = true;
            show();
            vm.$set('$data', ret);
            eval('var ret=' + ret.SelectUser);
            //console.log(ret);
            $('#TenderUser').multiselect('clearSelection');
            $(".remove").click();
            $("#TenderUser").multiselect('dataprovider', ret);
            $('#TenderUser').multiselect('refresh');
        }
    };
}();

//删除
function del() {

    list.del("Id", "/TenderInfoManager/Delete", function () {
        list.reload();
    });

}

//自定义的编辑按钮
function edit() {
    var selected = list.getSelectedObj();
    if (selected == null) {
        return;
    }
    if (selected.State != 0) {
        layer.msg("该状态下标书无法编辑！");
        return;
    }
    editDlg.update(selected);
}

function add() {
    editDlg.add();
}

function refresh() {
    list.reload();
}

function editFile() {
    var selected = list.getSelectedObj();
    if (selected == null) {
        return;
    }
    if (selected.State != 0) {
        layer.msg("该状态下标书无法编辑！");
        return;
    }
    layer.open({
        type: 2,
        skin: 'layui-layer-rim', //加上边框
        title: "用户管理", //不显示标题
        area: ['700px', '600px'], //宽高
        maxmin: true, //开启最大化最小化按钮
        content: "/TenderInfoManager/GetFiles?id=" + selected.Id,

    });

}
//发布
function publish() {
    var selected = list.getSelectedObj();
    if (selected == null) {
        return;
    } if (new Date(selected.StartTime) > new Date()) {
        layer.msg("未到开标时间禁止发布！");
        return;
    }
    if (selected.State != 0) {
        layer.msg("该状态下标书无法发布！");
        return;
    }
    var lid = layer.confirm("确定要开标？开标后不可编辑",
        null,
        function () {
            layer.close(lid);


            layer.open({
                type: 2,
                skin: 'layui-layer-rim', //加上边框
                title: "发布标书", //不显示标题
                area: ['800px', '700px'], //宽高
                maxmin: false, //开启最大化最小化按钮
                content: "/TenderInfoManager/TenderInfoDetail?id=" + selected.Id,
                btn: ['发布', '取消'],
                yes: function (index, layero) {
                    var data = $($(layero).find("iframe")[0].contentWindow.document.getElementById("userForm")).serializeArray();
                    data.push({ name: "id", value: selected.Id });
                    $.ajax(
                    {
                        type: 'POST',
                        url: '/TenderInfoManager/PublishTender',
                        dataType: 'json',
                        data: data,
                        success: function (data) {
                            layer.msg(data.Message);
                            list.reload();
                            if (data.Status) {
                                layer.close(index);

                            }
                        }
                    }
                )
                },
                cancel: function (index) {
                    layer.close(index);
                }
            });



            //$.post("/TenderInfoManager/PublishTender",
            //    { id: selected.Id },
            //    function (data) {
            //        if (data.Status) {
            //            list.reload();
            //        } else {
            //            layer.msg(data.Message);
            //        }
            //    },
            //    "json");
        });
}
//作废
function invalidtender() {
    var selected = list.getSelectedObj();
    if (selected == null) {
        return;
    }

    var lid = layer.confirm("确定要作废？作废后已经参加的竞标都会设置成作废！",
        null,
        function () {
            layer.close(lid);
            $.post("/TenderInfoManager/InvalidTender",
                { id: selected.Id },
                function (data) {
                    if (data.Status) {
                        list.reload();
                    } else {
                        layer.msg(data.Message);
                    }
                },
                "json");
        });
}
//截止标书
function stoptender() {
    var selected = list.getSelectedObj();
    if (selected == null) {
        return;
    }

    var lid = layer.confirm("确定要停止招标？",
        null,
        function () {
            layer.close(lid);
            $.post("/TenderInfoManager/StopTender",
                { id: selected.Id },
                function (data) {
                    if (data.Status) {
                        list.reload();
                    } else {
                        layer.msg(data.Message);
                    }
                },
                "json");
        });
}
//@@ sourceURL=TenderInfo.js

function btn_detail(id) {

    layer.open({
        type: 2,
        skin: 'layui-layer-rim', //加上边框
        title: "标书详情", //不显示标题
        area: ['800px', '700px'], //宽高
        maxmin: false, //开启最大化最小化按钮
        content: "/TenderInfoManager/TenderInfoDetail?id=" + id+"&type=1",
    });

}