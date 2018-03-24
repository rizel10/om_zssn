class Api::V1::GeneralReportsController < Api::V1::BaseController

	def percentage_infected
		pct_infected = (Survivor.where("reports_count >= ?", 3).size.to_f/Survivor.count)
		pct_not_infected = 100.0 - pct_infected
		render json: { infected: pct_infected, not_infected: pct_not_infected }
	end

	def avg_item_amount
		s_count = Survivor.count
		h = Hash.new
		Item.item_types.keys.each do |k|
			h[k.to_sym] = Item.find_by_item_type(k).survivor_items.sum(:amount)/s_count
		end

		render json: h.as_json
	end

	def points_lost
		render json: { points_lost: Survivor.where("reports_count >= ?", 3).includes(:inventories).sum(:total_value) }
	end

end