require "json"

class ItemsDto
  include JSON::Serializable

  def initialize(it : Items)
    @id = it.id
    @todos_id = it.todos_id
    @checked = it.checked
    @name = it.name
  end
end

class CreateItemsDto
  include JSON::Serializable

  property name : String

  def initialize(@name : String)
  end
end