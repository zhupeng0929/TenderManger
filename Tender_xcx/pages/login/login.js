var app = getApp()
var timer

Page({
  data: {
    dialogTip: false, //  提示框
    tipText: '',      //  提示框内容
  },

  onLoad(e) {
    this.checklogin();
  },
  checklogin() {
    var jwt = null;
    jwt = wx.getStorageSync('jwt')
    if (jwt) {

      app.http({
        method: 'post',
        url: "Account/CheckLogin",
        data: {
        },
        token: true
      }).then(res => {
        wx.hideLoading()

        if (res.Status) {
          wx.reLaunch({
            url: '/pages/tenderlist/tenderlist'
          })
          return
        }
      })
    }
  },
  doLogin(e) {
    var account = e.detail.value.account
    var password = e.detail.value.password

    // if (account.length < 6 || account.length > 12) {
    //   this._tipFun('账号格式不正确')

    //   return
    // }

    // if (password.length < 6 || password.length > 16) {
    //   this._tipFun('密码格式不正确')

    //   return
    // }

    //  执行登录操作
    wx.showLoading({ title: '登录中...' })

    wx.login({
      success: res => {
        var wxcode = res.code

        app.http({
          method: 'post',
          url: "Account/Login",
          data: {
            username: account,
            password: password
          },
          token: false
        }).then(res => {
          wx.hideLoading()

          if (!res.Status) {
            this._tipFun('账号或密码错误，请重试')
            return
          }

          wx.setStorageSync('jwt', res.Result)

          //  登录成功
          this._tipFun('登录成功，即将跳转')

          setTimeout(() => {
            // var pages = getCurrentPages()
            // var prevPage = pages[pages.length - 2]
            // prevPage.setData({
            //   isBind: true
            // });

            // wx.navigateBack({
            //   delta: 1
            // })
            wx.reLaunch({
              url: '/pages/tenderlist/tenderlist'
            })
          }, 1100)

        })
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

  navigateTo(e) {
    wx.navigateTo({
      url: e.currentTarget.dataset.url
    })
  }

})