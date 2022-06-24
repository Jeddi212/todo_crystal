require "../../../models/*"

module ItemRepository
  def self.delete_from_todo(id : Int32)
    Items.all.where { c("todo_id") == id }.destroy
  end
end
