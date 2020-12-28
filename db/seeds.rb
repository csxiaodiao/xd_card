# frozen_string_literal: true

儿牙诊疗金 总数量1000张
预成冠抵扣15元（设置300张）
预成冠抵扣28元（设置250张）
预成冠抵扣35元（设置200张）
预成冠抵扣45元（设置150张）
预成冠抵扣50元（设置100张）

全瓷冠诊疗金 总数量1000张
全瓷冠项目抵扣188元（设置325张）
全瓷冠项目抵扣208元（设置275张）
全瓷冠项目抵扣388元（设置250张）
全瓷冠项目抵扣428元（设置100张）
全瓷冠项目抵扣500元（设置50张）

种植诊疗金（适用于所有种植项目）总数量1000张
种植诊疗金抵扣580元（设置325张）
种植诊疗金抵扣680元（设置275张）
种植诊疗金抵扣780元（设置250张）
种植诊疗金抵扣880元（设置100张）
种植诊疗金抵扣980元（设置50张）


矫正诊疗金 总数量1000张
传统矫正诊疗金抵扣880元（设置300张）
传统矫正诊疗金抵扣980元（设置250张）
国产时代天使诊疗金抵扣1680元（设置210张）
国产时代天使诊疗金抵扣2000元（设置160张）
进口隐适美隐形矫正诊疗金抵扣2680元（设置50张）
进口隐适美隐形矫正诊疗金抵扣3000元（设置30张）

美白诊疗金 总数量1000张
美白诊疗金抵扣520元（设置350张）
美白诊疗金抵扣660元（设置250张）
美白诊疗金抵扣750元（设置200张）
美白诊疗金抵扣880元（设置150张）
美白诊疗金抵扣980元（设置50张）












items = [
  { name: "儿牙诊疗金", least_cost: 1501, reduce_cost: 1500, sku: 300 },
  { name: "儿牙诊疗金", least_cost: 2801, reduce_cost: 2800, sku: 250 },
  { name: "儿牙诊疗金", least_cost: 3501, reduce_cost: 3500, sku: 200 },
  { name: "儿牙诊疗金", least_cost: 4501, reduce_cost: 4500, sku: 150 },
  { name: "儿牙诊疗金", least_cost: 5001, reduce_cost: 5000, sku: 100 },

  { name: "修复诊疗金", least_cost: 18801, reduce_cost: 18800, sku: 325 },
  { name: "修复诊疗金", least_cost: 20801, reduce_cost: 20800, sku: 275 },
  { name: "修复诊疗金", least_cost: 38801, reduce_cost: 38800, sku: 250 },
  { name: "修复诊疗金", least_cost: 42801, reduce_cost: 42800, sku: 100 },
  { name: "修复诊疗金", least_cost: 50001, reduce_cost: 50000, sku: 50 },

  { name: "种植诊疗金", least_cost: 58001, reduce_cost: 58000, sku: 325 },
  { name: "种植诊疗金", least_cost: 68001, reduce_cost: 68000, sku: 275 },
  { name: "种植诊疗金", least_cost: 78001, reduce_cost: 78000, sku: 250 },
  { name: "种植诊疗金", least_cost: 88001, reduce_cost: 88000, sku: 100 },
  { name: "种植诊疗金", least_cost: 98001, reduce_cost: 98000, sku: 50 },

  { name: "矫正诊疗金", least_cost: 88001, reduce_cost: 88000, sku: 300 },
  { name: "矫正诊疗金", least_cost: 98001, reduce_cost: 98000, sku: 250 },
  { name: "矫正诊疗金", least_cost: 168001, reduce_cost: 168000, sku: 210 },
  { name: "矫正诊疗金", least_cost: 200001, reduce_cost: 200000, sku: 160 },
  { name: "矫正诊疗金", least_cost: 268001, reduce_cost: 268000, sku: 50 },
  { name: "矫正诊疗金", least_cost: 300001, reduce_cost: 300000, sku: 30 },

  { name: "美白诊疗金", least_cost: 52001, reduce_cost: 52000, sku: 350 },
  { name: "美白诊疗金", least_cost: 66001, reduce_cost: 66000, sku: 250 },
  { name: "美白诊疗金", least_cost: 75001, reduce_cost: 75000, sku: 200 },
  { name: "美白诊疗金", least_cost: 88001, reduce_cost: 88000, sku: 150 },
  { name: "美白诊疗金", least_cost: 98001, reduce_cost: 98000, sku: 50 },
]
items.each do |item|
  title = "#{(item[:reduce_cost] / 100)}元#{item[:name]}"
  card_hash = {
    card: {
      card_type: "CASH",
      cash: {
        base_info: {
          logo_url: "http://mmbiz.qpic.cn/mmbiz/iaL1LJM1mF9aRKPZJkmG8xXhiaHqkKSVMMWeN3hLut7X7hicFNjakmxibMLGWpXrEXB33367o7zHN0CwngnQY7zb7g/0",
          brand_name: "现代口腔",
          code_type: "CODE_TYPE_TEXT",
          title: title,
          color: "Color010",
          notice: "使用时向前台出示此券",
          service_phone: "02088888888",
          description: "不可与其他优惠同享",
          date_info: {
            type: "DATE_TYPE_FIX_TIME_RANGE",
            begin_timestamp: 1607588748,
            end_timestamp: 1608988748,
          },
          sku: {
            quantity: 50,
          },
        },
        least_cost: item[:least_cost],
        reduce_cost: item[:reduce_cost],
      },
    },
  }

  binding.pry

  # puts card_hash
end
# Wechat.api.card_create(card_hash)

# Wechat.api.groups
