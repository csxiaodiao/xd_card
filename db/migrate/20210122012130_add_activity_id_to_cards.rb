# frozen_string_literal: true

class AddActivityIdToCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :cards, :activity, foreign_key: true
  end
end
