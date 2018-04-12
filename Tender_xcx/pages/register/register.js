var app = getApp()
var timer

Page({
  data: {
    dialogTip: false,
    tipText: '',
    isSend: false,
    second: 120,
    phone: '',
    msgCode: ''
  },

  onShow: function () {
    var deadline = wx.getStorageSync('deadline')
    var timestamp = Date.parse(new Date()) / 1000
    var sec = deadline - timestamp

    if (sec > 0) {
      this.setData({
        isSend: true,
        second: sec
      })

      this._countdown()
    }
  },

  getPhone(e) {
    this.setData({
      phone: e.detail.value
    })
  },

  _countdown() {
    if (this.data.second == 0) {
      this.setData({
        isSend: false,
        second: 120
      })

      return
    }

    setTimeout(() => {
      this.setData({
        second: --this.data.second
      })

      this._countdown()
    }, 1000)
  },

  sendCode(e) {
    if (!this.verifyPhone(this.data.phone)) {
      return
    }

    if (this.data.isSend) {
      this._tipFun('已发送，若未接收到，请120S后重试')
      return
    }

    //  发送短信验证码
    var data = {
      phone: this.data.phone
    }

    wx.showLoading({ title: '发送中...' })

    app.http({
      method: 'post',
      url: 'xxx',
      data: data,
      token: false
    }).then(res => {

      wx.hideLoading()

      // 后端代码还需要整理
      if (res.status_code == 200) {

        this._tipFun('验证码已发送')

        var deadline = Date.parse(new Date()) / 1000 + 120

        wx.setStorageSync('deadline', deadline)

        this.setData({
          isSend: true,
          second: 120
        })

        this._countdown()
      } else {
        this._tipFun(res.message)
      }
    })

  },

  //  校验手机号是否正确
  verifyPhone(phone) {
    if (!phone) {
      this._tipFun('请填写手机号码')
      return false
    }

    var reg = /^1[3|4|5|7|8][0-9]{9}$/
    if (!reg.test(phone)) {
      this._tipFun('手机号码不正确')
      return false
    }

    return true
  },

  //  校验短信验证码格式
  verifyCode(code) {
    if (!code) {
      this._tipFun('请填写短信验证码')
      return false
    }
    var reg = /^[0-9]{4}$/
    if (!reg.test(code)) {
      this._tipFun('验证码格式不正确')
      return false
    }
    return true
  },

  //  校验密码是否正确
  verifyPassword(password) {
    if (!password) {
      this._tipFun('请填写密码')
      return false
    }
    if (password.length < 6 || password.length > 16) {
      this._tipFun('密码6~16位')
      return false
    }
    return true
  },


  //  注册账号
  doRegister(e) {

    wx.login({
      success: res => {
        var wxcode = res.code

        var phone = e.detail.value.phone
        var msgcode = e.detail.value.msgcode
        var password = e.detail.value.password

        if (!this.verifyPhone(phone)) {
          return
        }
        //  验证短信码格式
        if (!this.verifyCode(msgcode)) {
          return
        }
        //  验证密码格式
        if (!this.verifyPassword(password)) {
          return
        }

        //  请求服务器，验证短信验证码是否正确

        wx.showLoading({ title: '注册中...' })

        app.http({
          method: 'post',
          url: 'xxx',
          data: {
            identity_type: 'miniprogram',
            wxcode: wxcode,
            phone: phone,
            code: msgcode,
            password: password
          },
          token: false
        }).then(res => {
          wx.hideLoading()

          if (res.data !== undefined) {
            var authorization = res.data.authorization.data
            console.log(authorization)
            wx.setStorageSync('jwt', JSON.stringify(authorization))

            this._tipFun('注册成功，即将离开')

            wx.switchTab({
              url: '/pages/user/user'
            })

          } else {
            this._tipFun(res.message)
          }

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
  }

})