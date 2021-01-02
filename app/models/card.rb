class Card < ApplicationRecord
  include AASM
  extend Enumerize

  enumerize :status, in: { padding: 1, receive: 2, finished: 3}, scope: true

  STATUS = { pending: 1, received: 2, finished: 3, failed: 4, nothing: 5 }

  def self.hospitals
    [
      ['雅乐门诊', 1],
      ['新碶门诊', 2],
      ['健安门诊', 3],
    ]
  end

  def self.statuses
    STATUS.with_indifferent_access
  end

  enumerize :status, in: STATUS, default: :pending,  scope: true

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :received
    state :finished

    event :receive do
      transitions from: :pending, to: :received
    end

    event :finish do
      transitions from: :received, to: :finished
    end
  end


end
