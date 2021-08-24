class CreditcardController < ApplicationController

  require "payjp"
  before_action :set_card

  def index
  end

  def new
    @card = Creditcard.new
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_key)
    if params['payjp-token'].present?
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to mypages_path(current_user.id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def delete
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_key)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
    redirect_to mypages_path(current_user.id)
  end

  def show 
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :secret_key)
      customer = Payjp::Customer.retrieve(@card.customer_id) 
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "jcb.jpeg"
      when "MasterCard"
        @card_src = "master.png"
      when "American Express"
        @card_src = "amex.png"
      when "Diners Club"
        @card_src = "diners.gif"
      when "Discover"
        @card_src = "discover.jpg"
      end
    else
      redirect_to action: "new"
    end
 end

  private

  def set_card
    @card = Creditcard.find_by(user_id: current_user)
  end
end