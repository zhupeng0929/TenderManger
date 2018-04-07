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
    $('#food').multiselect({
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
                },

                //{
                //    name: 'FirstUser',
                //    index: 'FirstUser',
                //    label: '第一开标人',
                //    width: 100
                //},
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
                    isSelect: 'ok'
                });
        },
        update: function (ret) {  //弹出编辑框
            update = true;
            show();
            vm.$set('$data', ret);
        }
    };
}();

//删除
function del() {
    //var selected = list.getSelectedObj();
    //if (selected == null) return;

    //$.getJSON('/TenderInfoManager/Delete?Id=' + selected.Id, function (data) {
    //    if (data.statusCode == "200") {
    //        list.reload();

    //    }
    //    else {
    //        $(this).alertmsg('warn', data.message);
    //    }
    //});
    list.del("Id", "/TenderUserManager/Delete", function () {
        list.reload();
    });
}

//自定义的编辑按钮
function edit() {
    var selected = list.getSelectedObj();
    if (selected == null) {
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
    
    layer.open({
            type: 2,
            skin: 'layui-layer-rim', //加上边框
            title: "用户管理", //不显示标题
            area: ['700px', '600px'], //宽高
            maxmin: true, //开启最大化最小化按钮
            content: "/TenderInfoManager/GetFiles?id="+ selected.Id,

        });
   
}

//@@ sourceURL=TenderInfo.js