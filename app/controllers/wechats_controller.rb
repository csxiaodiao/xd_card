class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_responder

  on :event, with: 'subscribe' do |request|
    request.reply.text '终于等到您，还好我没放弃~
现代口腔感谢您的关注和支持！
【医院地址/咨询热线】
新碶门诊：北仑区新碶新大路308号
咨询热线：0574-86832226
凯旋门诊：北仑区新碶岷山路815号
咨询热线：0574-86115666
大碶门诊：北仑区大碶人民南路79号
咨询热线：0574-86115999'
  end

  on :text, with: '666' do |request|
    request.reply.text '<a href="http://wx.bestpv.cn/activities/3/card">MR祝.Guitar Scool联盟礼品券</a>👈'
  end
end
