require "../../../models/*"

module TodoRepository
  def self.find_all()
    arr_todo = [] of TodosDto

    t = Todo.all
    t.each do |it|
      items_dto = [] of ItemsDto
      it.items.each { |it| items_dto << ItemsDto.new it }

      arr_todo << TodosDto.new it, items_dto
    end

    arr_todo
  end

  def self.save(todo : Todo, items_dto = [] of CreateItemsDto) : TodosDto
    Jennifer::Adapter.default_adapter.transaction do |tx|
      todo.save

      items = [] of Items
      items_dto.each { |it| todo.add_items Items.new(it, todo.id) }
    end

    items = Items.all.where { c("todo_id") == todo.id }

    items_dto = [] of ItemsDto
    items.each { |it| items_dto << ItemsDto.new it }

    TodosDto.new todo, items_dto
  end
end
