class CardsController < ApplicationController
  # include CableReady::Broadcaster

  def index
    @cards = Card.all.order(created_at: :desc)
    @card = Card.new
  end

  def create
    card = Card.create(card_params)
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:name, :description)
  end
end
