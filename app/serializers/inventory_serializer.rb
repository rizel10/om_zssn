class InventorySerializer < ActiveModel::Serializer
  attributes([:id, :total_value, :trade_id] + Item.item_types.keys)
  # attributes :id, :water, :ammunition, :food, :medication, :total_value
end
