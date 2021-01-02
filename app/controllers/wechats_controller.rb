class WechatsController < ApplicationController
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#wechat_responder---rails-responder-controller-dsl
  wechat_responder



  on :event, with: 'subscribe' do |request|
    request.reply.text '终于等到您，还好我没放弃~<br/>
现代口腔感谢您的关注和支持！<br/>
<a href="http://wx.bestpv.cn/card">百万诊疗金领取</a>👈
【医院地址/咨询热线】<br/>
新碶门诊：北仑区新碶新大路308号<br/>
咨询热线：0574-86832226<br/>
凯旋门诊：北仑区新碶岷山路815号<br/>
咨询热线：0574-86115666<br/>
大碶门诊：北仑区大碶人民南路79号<br/>
咨询热线：0574-86115999'
  end

end




