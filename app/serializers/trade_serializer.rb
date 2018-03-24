class TradeSerializer < ActiveModel::Serializer
  attributes :id, :inventory_1, :inventory_2

  def inventory_1
  	InventorySerializer.new(object.inventory_1).as_json  	
  end

  def inventory_2
  	if object.inventory_2
  		InventorySerializer.new(object.inventory_2).as_json  	
  	else
  		nil
  	end
  end

end
