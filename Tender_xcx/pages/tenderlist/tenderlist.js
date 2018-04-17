var app = getApp()
import $wuxCountDown from '../../utils/countdown.js'
var { dayTimeArr } = require('../../utils/util.js')
// pages/tenderlist.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    TenderInfo: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getTendetList();
    this.setData({
      baseurl: app.baseurl
    });

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
  //  获取所有可参加标书
  getTendetList() {
    app.http("TenderInfo/GetTenderList").then(res => {
      this.setData({
        TenderInfo: res.Result
      });
      // var mpThing = this.data.TenderInfo
      // var that=this;
      // mpThing.find(function (v) {

      //   var aa = (new Date(v.EndTime.replace(/-/g, '/')) - new Date())/1000;

      //   var bb = dayTimeArr(aa);
      //   v.EndTime = bb
      //   that.setData({
      //     TenderInfo: mpThing,
      //   })
      //   var ref = setInterval(function () {
      //     aa--
      //     var timeArr = dayTimeArr(aa);
      //     v.EndTime = timeArr
      //     that.setData({
      //       TenderInfo: mpThing,
      //     })
      //   }, 1000);
      // })
      if (this.data.TenderInfo.length > 0) {
        for (var idx in this.data.TenderInfo) {
          var subject = this.data.TenderInfo[idx];
          this.countdown('TenderInfo[' + idx + '].EndTime', subject.EndTime.replace(/-/g, '/'))
        }
      }
    })
  },
  countdown: function (that, data) {
    return new $wuxCountDown({
      date: data,
      render(date) {
        const days = this.leadingZeros(date.days, 2) + '天'
        const hours = this.leadingZeros(date.hours, 2) + ':'
        const min = this.leadingZeros(date.min, 2) + ':'
        const sec = this.leadingZeros(date.sec, 2)
        var param = {};
        param[that] = days + hours + min + sec;
        this.setData(param)

      },
    })
  }
})