# require "../../../models/todos"
require "json"
require "./item_dto"

class TodosDto
  include JSON::Serializable

  def initialize(@id : Int32 | Nil, @title : String, @created_at : Time?, @updated_at : Time?)
  end

  def initialize(todo : Todo)
    @id = todo.id
    @title = todo.title
    @created_at = todo.created_at
    @updated_at = todo.updated_at
  end
end

class CreateTodosDto
  include JSON::Serializable

  property title : String
  property items = [] of CreateItemsDto

  def initialize(@title : String)
  end
end