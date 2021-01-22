# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[wechat]

  has_many :user_cards
  has_many :cards, through: :user_cards

  def received_and_finished_cards(activity)
    cards.where(activity_id: activity).with_status(:received, :finished)
  end

  def can_use_cards
    cards.with_status(:received).where('expiration_date > ?', Time.now)
  end

  def received_cards_kinds(activity)
    received_and_finished_cards(activity).map(&:kind).uniq
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "#{auth.uid}@email.com"
      user.password = Devise.friendly_token[0, 20]
      user.nickname = auth.nickname
      user.avatar = auth.image
    end
  end
end
