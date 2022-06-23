require "jennifer"

require "./todo"

class Items < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    todo_id: Int32?,
    checked: Bool?,
    name: String,
    created_at: Time?,
    updated_at: Time?,
  )

  belongs_to :todo, Todo

  def initialize(it : CreateItemsDto, todo_id : Int32 | Nil)
    @name = it.name
    @checked = false
    @todo_id = todo_id
  end
end
