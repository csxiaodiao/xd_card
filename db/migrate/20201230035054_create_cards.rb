class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name, comment: "卡券名"
      t.string :code, comment: "卡券号"
      t.string :cost, comment: "抵扣金额"
      t.string :use, comment: "使用条件"
      t.datetime :expiration_date, comment: "过期时间"
      t.string :explain, comment: "使用说明"
      t.string :kind, comment: "大分类"
      t.integer :lock_version, default: 0
      t.integer :status, default: 1


      t.timestamps
    end
  end
end
