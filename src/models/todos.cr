require "jennifer"

require "./items"

class Todos < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    title: String,
    created_at: Time?,
    updated_at: Time?,
  )

  has_many :todo_items, Items

  def initialize(@id : Int32 | Nil, @title : String, @created_at : Time?, @updated_at : Time?)
  end

  def initialize(dto : CreateTodosDto)
    @title = dto.title
  end
end
