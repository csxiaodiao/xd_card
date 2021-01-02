class UsersController < BaseController
  def cards
     @received_cards = current_user.cards
  end
end
