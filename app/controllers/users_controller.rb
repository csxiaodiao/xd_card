# frozen_string_literal: true

class UsersController < BaseController
  def cards
    @received_cards = current_user.cards.order(expiration_date: :desc)
  end
end
