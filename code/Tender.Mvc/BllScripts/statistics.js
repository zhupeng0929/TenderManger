

//grid列表模块
function MainGrid() {
    var url = '/Statistics/Load';

    this.maingrid = $('#maingrid')
        .jqGrid({
            colModel: [
                {
                    name: 'Title',
                    label: '标题',
                    index: 'Title',
                    width: 100
                },
                {
                    name: 'Persons',
                    label: '投标人数',
                    index: 'Persons',
                    width: 100,
                    sortable :true
                },
                {
                    name: 'Price',
                    index: 'Price',
                    label: '中标金额',
                    width: 100,
                    sortable: true
                }
            ],
            url: url,
            datatype: "json",

            viewrecords: true,
            rowNum: 18,
            pager: "#grid-pager",
            altRows: true,
            height: 'auto',
            multiselect: false ,
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


