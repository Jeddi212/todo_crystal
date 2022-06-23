require "json"

class ItemsDto
  include JSON::Serializable

  def initialize(
    @id : Int32 | Nil, 
    @todos_id : Int32 | Nil, 
    @checked : Bool | Nil,
    @name : String)
  end

  def initialize(it : Items)
    @id = it.id
    @todos_id = it.todo_id
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