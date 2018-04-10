
var selectedId = '00000000-0000-0000-0000-000000000000';  //ztree选中的模块
var zTreeObj;
$(function () {
    ztree.reload();
});
//左边分类导航树
var ztree = function () {
    var url = '/BidInfoManager/LoadForTree';
    var setting = {
        view: {
            selectedMulti: false,
            fontCss: setFontCss
        },
        data: {
            key: {
                name: 'Title',
                title: 'Title'
            },
            simpleData: {
                enable: true,
                idKey: 'Id',
                pIdKey: 'ParentId',
                rootPId: 'null'
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                list.reload(treeNode.Id);
            }
        }
    };
    function setFontCss(treeId, treeNode) {
        if (treeNode.State > 1) {
            return { color: "red" } ;
        }
        if (treeNode.State == 1) {
            return { color: "green" };
        }
    };
    var load = function () {
        $.getJSON(url, function (json) {
             zTreeObj = $.fn.zTree.init($("#usertree"), setting, json);
            selectedId = zTreeObj.getNodes()[0].Id;
            list.reload();
            zTreeObj.expandAll(true);
        });
    };
    load();

    return {
        reload: load
    }
}();

//grid列表模块
function MainGrid() {
    var url = '/BidInfoManager/Load?parentId=';
    
    this.maingrid = $('#maingrid')
        .jqGrid({
            colModel: [
               {
                   name: 'Id',
                   label: 'Id',
                   index: 'Id',
                   hidden:true
               },
               {
                   name: 'TenderId',
                   index: 'TenderId',
                   label: '标书id', hidden: true
               },
               {
                   name: 'TenderTitle',
                   index: 'TenderTitle',
                   label: '标书标题',
               },
               {
                   name: 'UserId',
                   index: 'UserId',
                   label: '投标人id', hidden: true
               },
               {
                   name: 'UserName',
                   index: 'UserName',
                   label: '投标人名称',
               },
               {
                   name: 'TenderPriceDes',
                   index: 'TenderPriceDes',
                   label: '投标金额',
               },
               {
                   name: 'CreateDate',
                   index: 'CreateDate',
                   label: '投标时间',
               },
               {
                   name: 'State',
                   index: 'State',
                   hidden: true
               },
               {
                   name: 'StateDes',
                   index: 'StateDes',
                   label: '竞标状态',
                   formatter: function (cellvalue, options, rowObject) {
                       if (rowObject.State == 0) {
                           return '<span  class=\"label label-info arrowed\">竞标中</span>';
                       } else if (rowObject.State == 1) {
                           return '<span  class=\"label label-success arrowed-in\">已中标</span>';
                       } else if (rowObject.State == 2) {
                           return '<span  class=\"label label-pink\">未中标</span>';
                       } else {
                           return '<span  class=\"label label-grey\">已作废</span>';
                       }
                   }
               },
               
            ],
            url: url+ selectedId,
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
        if (id != undefined) selectedId = id;
        this.maingrid.jqGrid("setGridParam", { url: url + selectedId })
            .trigger("reloadGrid", [{ page: 1 }]);  //重载JQGrid

    };
};
MainGrid.prototype = new Grid();
var list = new MainGrid();

var vm = new Vue({
    el: '#editDlg'
});



//添加（编辑）对话框
//var editDlg = function () {
//    var update = false;
//    var show = function () {
//        BJUI.dialog({ id: 'editDlg', title: '编辑对话框', target: '#editDlg' });
//        $("#btnSave").on("click", function () {
//            editDlg.save();
//        });
//    }
//    return {
//        add: function () {  //弹出添加
//            update = false;
//            show();
//            $.CurrentDialog.find("form")[0].reset();  //reset方法只能通过dom调用
//            $("#Id").val(0);

//        },
//        update: function (ret) {  //弹出编辑框
//            update = true;
//            show();
//            $('#Id').val(ret.Id);
//            $('#TenderId').val(ret.TenderId);
//            $('#TenderTitle').val(ret.TenderTitle);
//            $('#UserId').val(ret.UserId);
//            $('#UserName').val(ret.UserName);
//            $('#TenderPrice').val(ret.TenderPrice);
//            $('#CreateDate').val(ret.CreateDate);
//        },
//        save: function () {  //编辑-->保存
//            $('#editForm').isValid(function (v) {
//                if (!v) return;  //验证没通过
//                $("#editForm").bjuiajax('ajaxForm', {
//                    reload: false,
//                    callback: function (json) {
//                        list.reload();
//                        ztree.reload();
//                    }
//                });
//            });
//        }
//    };
//}();

//删除
function del() {
    var selected = list.getSelectedObj();
    if (selected == null) return;

    $.getJSON('/BidInfoManager/Delete?Id=' + selected.Id, function (data) {
        if (data.statusCode == "200") {
            list.reload();
            ztree.reload();
        }
        else {
            $(this).alertmsg('warn', data.message);
        }
    });
}

////自定义的编辑按钮
//function edit() {
//    var selected = list.getSelectedObj();
//    if (selected == null) {
//        return;
//    }
//    editDlg.update(selected);
//}

//function add() {
//    editDlg.add();
//}

function refresh() {
    list.reload();
}

//发布中标
function publishbid() {
    var selectednode = zTreeObj.getSelectedNodes();
    if (selectednode.length == 0 || selectednode[0].Id == '00000000-0000-0000-0000-000000000000') {
        layer.msg('请先选择标书！');
        return;
    }
    var selected = list.getSelectedObj();
    if (selected == null) {
        layer.msg('请先选择投标人！');
        return;
    }

    var lid = layer.confirm("确认该标书已截止招标",
        null,
        function () {
            layer.close(lid);
            $.post("/TenderInfoManager/CheckDate",
                { id: selectednode[0].Id },
                function (data) {
                    if (data.Status) {

                        $.post("/BidInfoManager/UpdateBidinfoState",
                            {
                                bidinfoid: selected.Id,
                                tenderid: selectednode[0].Id
                            },
                            function (data) {
                                if (data.Status) {
                                    list.reload();
                                } else {
                                    layer.msg(data.Message);
                                }
                            },
                            "json");
                    } else {
                        layer.msg(data.Message);
                    }
                },
                "json");
        });
    

}