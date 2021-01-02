UserCard.destroy_all
Card.destroy_all

items = [
  # er
  { name: "儿牙诊疗金", desc_name: "儿童预成冠", kind: "er", cost: 15, sku: 300 },
  { name: "儿牙诊疗金", desc_name: "儿童预成冠", kind: "er", cost: 28, sku: 250 },
  { name: "儿牙诊疗金", desc_name: "儿童预成冠", kind: "er", cost: 35, sku: 200 },
  { name: "儿牙诊疗金", desc_name: "儿童预成冠", kind: "er", cost: 45, sku: 150 },
  { name: "儿牙诊疗金", desc_name: "儿童预成冠", kind: "er", cost: 50, sku: 100 },


  { name: "全瓷冠诊疗金", desc_name: "全瓷冠", kind: "xf", cost: 188, sku: 325 },
  { name: "全瓷冠诊疗金", desc_name: "全瓷冠", kind: "xf", cost: 208, sku: 275 },
  { name: "全瓷冠诊疗金", desc_name: "全瓷冠", kind: "xf", cost: 388, sku: 250 },
  { name: "全瓷冠诊疗金", desc_name: "全瓷冠", kind: "xf", cost: 500, sku: 50 },


  { name: "种植诊疗金", desc_name: "种植", kind: "zz", cost: 580, sku: 325 },
  { name: "种植诊疗金", desc_name: "种植", kind: "zz", cost: 680, sku: 275 },
  { name: "种植诊疗金", desc_name: "种植", kind: "zz", cost: 780, sku: 250 },
  { name: "种植诊疗金", desc_name: "种植", kind: "zz", cost: 880, sku: 100 },
  { name: "种植诊疗金", desc_name: "种植", kind: "zz", cost: 980, sku: 50 },

  { name: "传统矫正诊疗金", desc_name: "传统矫正", kind: "zj", cost: 880, sku: 300 },
  { name: "传统矫正诊疗金", desc_name: "传统矫正", kind: "zj", cost: 980, sku: 250 },
  { name: "国产时代天使诊疗金", desc_name: "国产时代天使", kind: "zj", cost: 1680, sku: 210 },
  { name: "国产时代天使诊疗金", desc_name: "国产时代天使", kind: "zj", cost: 2000, sku: 160 },
  { name: "进口隐适美隐形矫正诊疗金", desc_name: "进口隐适美隐形矫正", kind: "zj", cost: 2680, sku: 50 },
  { name: "进口隐适美隐形矫正诊疗金", desc_name: "进口隐适美隐形矫正", kind: "zj", cost: 3000, sku: 30 },

  { name: "美白诊疗金", desc_name: "美白", kind: "mb", cost: 88, sku: 350 },
  { name: "美白诊疗金", desc_name: "美白", kind: "mb", cost: 128, sku: 350 },
  { name: "美白诊疗金", desc_name: "美白", kind: "mb", cost: 228, sku: 250 },
  { name: "美白诊疗金", desc_name: "美白", kind: "mb", cost: 300, sku: 200 },

]


cards = []

items.each do |item|
  item[:sku].times{

    cards << {
      name: "#{item[:cost]}元#{item[:name]}",
      code: SecureRandom.hex,
      cost: item[:cost],
      kind: item[:kind],
      use:  "凭此券在北仑现代口腔任意一家门诊消费#{item[:desc_name]}项目可抵扣现金",
      explain: "本券不可与门诊内其他优惠同享,每人限领1张,过期作废",
      expiration_date: "2021-01-31 23:59:59"
    }
  }

end

cards = cards.shuffle

Card.create(cards)
