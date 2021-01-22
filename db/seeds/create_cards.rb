# frozen_string_literal: true

activity = Activity.last
items = [

  { name: '传统矫正基金', desc_name: '传统矫正', kind: 'ctjz', cost: 1000, sku: 2000 },
  { name: '国产时代天使矫正基金', desc_name: '国产时代天使矫正', kind: 'sdts', cost: 2000, sku: 2000 },
  { name: '进口隐适美隐形矫正基金', desc_name: '进口隐适美隐形矫正', kind: 'ysm', cost: 3000, sku: 2000 }

]

cards = []

items.each do |item|
  item[:sku].times do
    cards << {
      name: "#{item[:cost]}元#{item[:name]}",
      code: SecureRandom.hex,
      cost: item[:cost],
      kind: item[:kind],
      use: "凭此券在北仑现代口腔任意一家门诊消费#{item[:desc_name]}项目可抵扣现金",
      explain: '本券不可与门诊内其他优惠同享,每人限领1张,过期作废',
      expiration_date: '2021-02-28 23:59:59',
      activity_id: activity.id,
      created_at: Time.now,
      updated_at: Time.now
    }
  end
end

cards = cards.shuffle

Card.insert_all(cards)
