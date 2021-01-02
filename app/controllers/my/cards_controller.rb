# frozen_string_literal: true

class My::CardsController < BaseController
  layout 'application'

  before_action :find_card, only: [:show, :edit, :update]


  def index
    @received_cards = current_user.cards.where("expiration_date > ?", Time.now)
  end

  def show
  end

  def edit
  end

  def update
    code = "1111"
    if params[:v_code] != "666666"
      msg = "核销码不正确，请询问店员确认"
      flash[:alert] = msg
      return redirect_back fallback_location: :back
    end

    if @card.finished?
      msg = "此券已使用"
      flash[:alert] = msg
       return redirect_back fallback_location: :back
    end

    begin
      ActiveRecord::Base.transaction do
        @card.finish!
        @user_card.use_date = Time.now
        @user_card.hospital_id = params[:hospital_id]
        @user_card.save!
      end
      redirect_to success_my_card_path(@card)
    rescue => exception
      msg = "核销失败,未知错误"
      flash[:alert] = msg
      return redirect_back fallback_location: :back
    end


  end

  def success
  end

  private

  def find_card
    @user_card = current_user.user_cards.find_by_card_id(params[:id])
    @card = @user_card.card
  end

end
