# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[wechat]

  has_many :user_cards
  has_many :cards, -> { with_status(:received) }, through: :user_cards


  def received_cards
    cards.with_status(:finished).map(&:kind)
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
