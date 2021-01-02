class CreateUserCards < ActiveRecord::Migration[6.1]
  def change
    create_table :user_cards do |t|
      t.references :user, foreign_key: true, null: false, comment: "用户"
      t.references :card, foreign_key: true, null: false, comment: "卡券"
      t.string :kind, null:false, comment: "大分类"
      t.integer :hospital_id
      t.datetime :use_date
      t.datetime :received_date
      t.timestamps
    end
  end
end
