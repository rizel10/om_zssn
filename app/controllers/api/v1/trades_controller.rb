class Api::V1::TradesController < Api::V1::BaseController

	def create
    @survivor = Survivor.find(params[:survivor_id])
    @inventory = Inventory.new(request_trade_params)
    @trade = Trade.create!(inventory_1: @inventory)
    render json: @trade, status: :created
  end

  def accept
    @survivor = Survivor.find(params[:survivor_id])
    @inventory = Inventory.new(request_trade_params)
    @trade = Trade.find(params[:id])
    if @trade.inventory_2
      render json: { errors: "This trade has already been accepted" }, status: :forbbiden and return
    end
    @trade.inventory_2 = @inventory
    @trade.save!
    render json: @trade
  end

  ###
  private

    def request_trade_params
      params.permit(Item.item_types.keys.map { |i| i.to_sym }).merge(survivor: @survivor)
    end

    def location_params
      params.permit(:lat, :lng)
    end
end
