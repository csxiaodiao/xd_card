user = User.first
card = Card.where(kind: "er").with_status(:pending).first



"本次购物券已被领取完毕，请关注最新动态!" if card.blank?

begin
  card.with_lock do
    card.receive!
    user.user_cards.create!(card: card, kind: card.kind, received_date: Time.now)
  end
rescue ActiveRecord::StaleObjectError => e
  Rails.logger.info("你手太快了吧，可以去练小李飞刀了，请稍后再试。")
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.info("您已领取本项抵扣券，不能重复领取！")
end

