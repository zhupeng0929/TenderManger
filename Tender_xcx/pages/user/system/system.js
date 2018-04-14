var app = getApp()

Page({
  data: {

  },

  onLoad: function (options) {
    app.setBarColor()
  },
  
  logout() {
    app.http({
      url: 'Account/LogOut',
      data: {
       
      }
    }).then(res => {
      wx.removeStorageSync('jwt')

      wx.reLaunch({
        url: '/pages/login/login'
      })
    })
  }
})