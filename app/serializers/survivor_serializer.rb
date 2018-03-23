class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :lat, :lng, :my_stash

  def my_stash
  	InventorySerializer.new(object.my_stash).as_json
  end
end
