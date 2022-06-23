require "../../../models/*"

module TodoRepository
  def self.save(todo : Todo, items_dto = [] of CreateItemsDto) : Todo
    Jennifer::Adapter.default_adapter.transaction do |tx|
      todo.save

      items = [] of Items
      items_dto.each { |it| todo.add_items Items.new(it, todo.id) }
    end

    todo
  end
end
