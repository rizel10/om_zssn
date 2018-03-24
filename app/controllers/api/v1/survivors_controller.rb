class Api::V1::SurvivorsController < Api::V1::BaseController

	def create
    require_parameters([:name, :age, :gender, :lat, :lng])
    @survivor = Survivor.create!(survivor_params)
    render json: @survivor, status: :created
  end

  def update
    @survivor = Survivor.find(params[:id])
    @survivor.update!(location_params)
    render json: @survivor
  end

  def index
    @survivors = Survivor.includes(inventories: [survivor_items: :item]).all.page(params[:page]) #TODO: Eager loading isn't working properly on this request because of how inventory serializer works
    render json: @survivors
  end

  ###
  private

    def survivor_params
      params.permit(:name, :age, :gender, :lat, :lng, personal_stash: Item.item_types.keys.map { |i| i.to_sym })
    end

    def location_params
      params.permit(:lat, :lng)
    end
end
