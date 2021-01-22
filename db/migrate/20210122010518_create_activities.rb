# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status
      t.timestamps
    end
  end
end
