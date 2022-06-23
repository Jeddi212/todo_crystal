require "kemal"

require "../../../models/*"
require "../dto/todo_dto"

get "/todos" do
  todo = Todos.create({title: "New Title 3"})
  todo_dto = TodosDto.new(todo)
  puts
  p! todo_dto
  puts todo.inspect
end

get "/todos:id" do
  todo = Todos.create({title: "New Title 3"})
  puts
  puts
  puts todo.inspect
end

post "/todos" do
  
end

put "/todos:id" do |context|
  
end

delete "/todos:id" do
  
end

