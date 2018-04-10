$(function () {
    $("#Account").on("click", function () {
        parent.reload();
    });
    $('#Filedata').ace_file_input({
        no_file: 'No File ...',
        btn_choose: 'Choose',
        btn_change: 'Change',
        droppable: false,
        onchange: null,
        thumbnail: false //| true | large
        //whitelist:'gif|png|jpg|jpeg'
        //blacklist:'exe|php'
        //onchange:''
        //
    });
});

//grid列表模块
function MainGrid() {
    var url = '/TenderUserManager/Load';
    this.maingrid = $('#maingrid')
        .jqGrid({
            colModel: [
                { label: '主键', name: 'Id', hidden: true },
                { label: "账号", name: "Account", index: "Account" },
                { label: '名称', name: 'Name', index: 'Name', width: 100, align: 'left' },
                { label: '单位抬头', name: 'Company', index: 'Company', width: 150, align: 'left' },

                { label: '联系人', name: 'ContactPerson', index: 'ContactPerson', width: 180, align: 'left' },
                { label: '联系方式', name: 'ContactNum', index: 'ContactNum' },
                {
                    label: "保证金", name: "CashDeposit", index: "CashDeposit", width: 50, align: "left",
                    //formatter: function (cellvalue, options, rowObject) {
                    //    if (rowObject.enabledmark == 1) {
                    //        return '<span  class=\"label label-success\">启用</span>';
                    //    } else if (rowObject.enabledmark == 0) {
                    //        return '<span  class=\"label label-danger\">停用</span>';
                    //    } else {
                    //        return '<span  class=\"label label-info\">草稿</span>';
                    //    }
                    //}
                },
                {
                    label: '营业执照', name: 'psth', index: 'psth',
                    formatter: function (cellvalue, options, rowdata) {
                        if (rowdata.BusinessLicense) {
                            return ' <img src="' + rowdata.BusinessLicense + '" id="img' + rowdata.Id + '"  style="width:50px;height:50px;" />';
                        }
                        else {
                            return'<span>暂无</span>'
                        }
                        
                    }
                },
                {
                    name: 'BusinessLicense', index: 'BusinessLicense', hidden: true
                },

                //{ label: "备注", name: "Description", index: "Description", width: 200, align: "left" }

            ],
            url: url,
            datatype: "json",

            viewrecords: true,
            rowNum: 18,
            pager: "#grid-pager",
            altRows: true,
            height: 'auto',
            multiselect: true,
            multiboxonly: true,

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
//上级机构选择框
var parent = new ParentTree("/TenderUserManager/LoadForTree", "Account", "Id", "Account");

//删除
function del() {
    list.del("Id", "/TenderUserManager/Delete", function () {
        list.reload();
    });
}

//添加（编辑）对话框
var editDlg = function () {
    var update = false;
    var show = function () {
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            title: "用户管理", //不显示标题
            area: ['430px', '450px'], //宽高
            content: $('#editDlg'), //捕获的元素
            btn: ['保存', '关闭'],
            yes: function (index, layero) {
                $("#editForm").ajaxSubmit(
                    {
                        type: 'POST',
                        url: '/TenderUserManager/Add',
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
                //$.post("/TenderUserManager/Add", vm.$data, function (data) {
                //    layer.msg(data.Message);
                //    if (data.Status) {
                //        list.reload();
                //        //ztree.reload();
                //    }
                //}, "json");
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
        },
        update: function (ret) {  //弹出编辑框
            update = true;
            show();
            vm.$set('$data', ret);
        }
    };
}();


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




