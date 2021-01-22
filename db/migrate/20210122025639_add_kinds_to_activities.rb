# frozen_string_literal: true

class AddKindsToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :kinds, :string, array: true
  end
end
