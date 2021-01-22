# frozen_string_literal: true

class CardsController < BaseController
  wechat_api
  def show
    @activity = Activity.find(params[:activity_id])
    @received_cards = current_user.received_cards_kinds(@activity)
  end

  def receive
    code = '1111'
    activity = Activity.find(params[:activity_id])

    if activity.blank?
      msg = '活动不存在'
      return render json: { code: '0000', msg: msg }
    end
    if current_user.cards.where(activity_id: activity.id, kind: params[:kind]).exists?
      msg = '您已领取本项抵扣券，不能重复领取！'
      return render json: { code: '0000', msg: msg }
    end

    card = activity.cards.where(kind: params[:kind]).with_status(:pending).first

    if card.blank?
      msg = '本项抵扣券已被领取完毕，请关注最新动态!'
      return render json: { code: '0000', msg: msg }
    end

    begin
      card.with_lock do
        card.receive!
        current_user.user_cards.create!(card: card, kind: card.kind, received_date: Time.now)
        msg = "您已领取#{card.name}"
      end
    rescue ActiveRecord::StaleObjectError => e
      msg = '你手太快了吧，可以去练小李飞刀了，请稍后再试。'
      code = '0000'
    rescue ActiveRecord::RecordInvalid => e
      msg = '您已领取本项抵扣券，不能重复领取！'
      code = '0000'
    rescue StandardError => e
      msg = '请稍后再试一试'
      code = '0000'
    end

    render json: { code: code, msg: msg }
  end
end
