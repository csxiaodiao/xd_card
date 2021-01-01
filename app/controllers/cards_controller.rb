# frozen_string_literal: true

class CardsController < BaseController
  wechat_api
  def show
    Card.where(kind: "er").with_status(:padding)


    
  end

  def receive
    Card.transaction isolation: :repeatable_read do
      card = Card.find 1
      card.status = :lq
      card.save!
      current_user.user_cards.create(card: card)
    end
  end

end
