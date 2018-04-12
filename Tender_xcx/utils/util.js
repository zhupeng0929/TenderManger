function http(params) {
  wx.showNavigationBarLoading()

  let baseUrl = 'http://192.168.1.207:9100/Api/'  //  接口基础

  let url = typeof params === 'string' ? baseUrl + params : baseUrl + params.url  //  如果只传一个字符串则该字符串为 URL

  let method = params.method !== undefined ? params.method : 'get'
  let data = params.data !== undefined ? params.data : null
  let header = {}

  let jwt = null

  // 判断是否需要验证 token，注册登录等不需要验证token的非get请求
  let needToken = true

  if ((method === 'get' && params.token === undefined) || (params.token === false)) {
    needToken = false
  }

  // get参数拼接  
  if (method == "get" && data !== null) {

    for (let key in data) {
      if (data[key].toString() !== '') {
        url += "&" + key + "=" + data[key];
      }
    }

    url = url.replace('&', '?')  //  替换第一个&为？
    data = '';
  }

  if (needToken) {

    jwt = wx.getStorageSync('jwt')
    if (jwt) {
      // jwt = JSON.parse(jwt)

      // header = { Authorization: 'Bearer ' + jwt.token }
      header = { Authorization: jwt }
    } else {
      // 用户未登录
      return new Promise(
        function (resolve) {
          wx.hideNavigationBarLoading()
          resolve({ code: '401' })
        }
      )

      return false
    }
  }

  //返回Promise对象  
  return new Promise(

    function (resolve) {

      wx.request({
        method: method,
        url: url,
        data: data,
        header: header,
        success: (res) => {
          wx.hideNavigationBarLoading()
          let statusCode = res.statusCode

          switch (statusCode) {
            case 200:
              resolve(res.data)
              break
            case 201:
              resolve(res.data)
              break
            case 204:
              resolve(res.data)
              break
            case 401:
              if (params.url != 'authorizations') {
                wx.showToast({
                  title: '授权过期，请重新登录',
                  icon: 'none',
                  duration: 2000
                })
              }
              wx.removeStorageSync('jwt')
              resolve(res.data)
              break

            case 403:
              resolve(res.data)
              break
            default:
              wx.showToast({
                title: '未知错误',
                icon: 'none',
                duration: 2000
              })
          }
          resolve(res);
        },
        fail: function (res) {
          wx.showToast({
            title: '请检查网络',
            icon: 'none',
            duration: 2000
          })
        },
        complete: function (res) {
          // console.log(res)
        }
      })
    }
  )
}


function starToArray(val) {
  if (val == 0) return null
  var stars = []
  for (let i = 1; i < 6; i++) {
    i <= val ? stars.push(1) : stars.push(0)
  }
  return stars
}

//  格式化时间 将秒数转为 00:00 格式
function formatTime(sec) {
  var min = 0;
  min = Math.floor(sec / 60);		//	分
  min < 10 && (min = '0' + min);	//	补零
  sec = Math.floor(sec % 60);		//	秒
  sec < 10 && (sec = '0' + sec);	//	补零

  return min + ":" + sec;
}

const formatDate = date => {
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  const hour = date.getHours()
  const minute = date.getMinutes()
  const second = date.getSeconds()

  return [year, month, day].map(formatNumber).join('/') + ' ' + [hour, minute, second].map(formatNumber).join(':')
}

const formatNumber = n => {
  n = n.toString()
  return n[1] ? n : '0' + n
}

module.exports = {
  formatTime: formatTime,
  formatNumber: formatNumber,
  formatDate: formatDate,
  http: http,
  starToArray: starToArray
}
