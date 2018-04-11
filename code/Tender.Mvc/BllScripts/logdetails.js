

//grid列表模块
function MainGrid() {
    var url = '/log/Load';

    this.maingrid = $('#maingrid')
        .jqGrid({
            colModel: [
                {
                    name: 'LogDate',
                    label: '时间',
                    index: 'LogDate',
                    width: 100,
                    search: false
                },
                {
                    name: 'LogLevel',
                    label: '级别',
                    index: 'LogLevel',
                    width: 100,
                    sortable: true,
                    search: true,
                    stype: 'text',
                },
                {
                    name: 'LogActionClick',
                    index: 'LogActionClick',
                    label: '操作方法',
                    width: 100,
                    sortable: true,
                    search: true

                },
                {
                    name: 'UserName',
                    index: 'UserName',
                    label: '用户',
                    width: 100,
                    sortable: true,
                    search: true
                },
                {
                    name: 'LogMessage',
                    index: 'LogMessage',
                    label: '操作明细',
                    width: 100,
                    sortable: true,
                    search: false
                }
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
            search: true,
            loadComplete: function () {
                var table = this;
                setTimeout(function () {
                    updatePagerIcons(table);
                },
                    0);
            },

        }).jqGrid('navGrid', "#grid-pager", {
            edit: false, add: false, del: false, refresh: false, search: true
        }).jqGrid("filterToolbar", {
            autoSearch: true,

            searchOnEnter: true  //回车触发搜索
        });

    this.reload = function (id) {
        this.maingrid.jqGrid("setGridParam", { url: url })
            .trigger("reloadGrid", [{ page: 1 }]);  //重载JQGrid

    };
};
MainGrid.prototype = new Grid();
var list = new MainGrid();


