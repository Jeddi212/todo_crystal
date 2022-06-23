# require "../../../models/todos"
require "json"

class TodosDto
  include JSON::Serializable
  
  def initialize(@id : Int32 | Nil, @title : String, @created_at : Time?, @updated_at : Time?)
  end

  def initialize(todo : Todos)
    @id = todo.id
    @title = todo.title
    @created_at = todo.created_at
    @updated_at = todo.updated_at
  end
end

class CreateTodosDto
  include JSON::Serializable

  property title : String

  def initialize(@title : String)
  end
end