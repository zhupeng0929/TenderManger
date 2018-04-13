var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
  tenderinfo:{},
  baseurl: app.baseurl
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // var id=options.id;
    var id ='d8fb861b-f999-4e14-80b8-8fa2d77e7141'
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
    app.http("TenderInfo/GetTenderInfo?id="+id).then(res => {
      this.setData({
        tenderinfo: res.Result
      });
       
      wx.setNavigationBarTitle({
        title: res.Result.Title
      });
    })
  },
})