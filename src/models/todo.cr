require "jennifer"

require "./items"

class Todo < Jennifer::Model::Base
  with_timestamps

  mapping(
    id: Primary32,
    title: String,
    created_at: Time?,
    updated_at: Time?,
  )

  has_many :items, Items, dependent: :destroy

  @item_list : Array(Items)?

  def items
    @item_list ||= items_query.to_a
  end

  def items_query
    Items.all.where { _items__todo_id == id }
  end

  def initialize(@id : Int32 | Nil, @title : String, @created_at : Time?, @updated_at : Time?)
  end

  def initialize(dto : CreateTodosDto)
    @title = dto.title
  end
end
