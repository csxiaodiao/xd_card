class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_responder



  on :event, with: 'subscribe' do |request|
    request.reply.text '<a href="http://wx.bestpv.cn/card">百万诊疗金免费领取</a>'
  end

end
