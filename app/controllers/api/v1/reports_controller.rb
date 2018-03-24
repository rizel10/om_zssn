class Api::V1::ReportsController < Api::V1::BaseController

	def create
    # I will allow users to report themselves... Harsh times :(
    @survivor = Survivor.find(params[:survivor_id])
    @report = @survivor.reporteds.create!(survivor: Survivor.find_by_name(params[:name]))
    # No Content
  end

  ###
  private

    def survivor_params
      params.permit(:name, :age, :gender, :lat, :lng, personal_stash: Item.item_types.keys.map { |i| i.to_sym })
    end
end
