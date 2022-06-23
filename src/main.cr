require "./models/*"
require "../config/config"

require "kemal"

get "/" do
  # "#{typeof(conn).to_s} ::: OK"
  todo = Todos.create({title: "New Title 3"})
  item = Items.create({checked: false, todo_id: 1})
  puts
  puts
  puts todo.inspect
end

Kemal.run