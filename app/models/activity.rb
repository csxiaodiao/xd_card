# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :cards
end
