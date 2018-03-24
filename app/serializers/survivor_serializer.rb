class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :lat, :lng, :infected

  has_one :my_stash, serializer: InventorySerializer
end
