var app = getApp()
var timer
Page({

  /**
   * 页面的初始数据
   */
  data: {
    tenderinfo: {},
    baseurl: app.baseurl,
    dialogTip: false, //  提示框
    tipText: '',      //  提示框内容
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var id=options.id;
    // var id = '068d8008-98d4-482e-b134-607737216843'
    this.getTendetList(id);
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  //  获取所有可参加标书
  getTendetList(id) {
    app.http("TenderInfo/GetTenderInfo?id=" + id).then(res => {
      this.setData({
        tenderinfo: res.Result
      });

      wx.setNavigationBarTitle({
        title: res.Result.Title
      });
    })
  },
  sendTender(e) {
    var price = e.detail.value;
    app.http({
      method: 'post',
      url: "TenderInfo/AddBid",
      data: {
        id: this.data.tenderinfo.Id,
        price: price
      },
      token: true
    }).then(res => {
      if (res.Status) {
        this._tipFun('投标成功!')
        setTimeout(() => {
          wx.reLaunch({
            url: '/pages/tenderlist/tenderlist'
          })
        }, 1100)
      }
      else{
        this._tipFun(res.Message)
        return
      }
    })
  },
  _tipFun(msg) {
    this.setData({
      dialogTip: true,
      tipText: msg
    })

    clearTimeout(timer)
    timer = setTimeout(() => {
      this.setData({
        dialogTip: false
      })
    }, 2000)
  },
})