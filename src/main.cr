require "kemal"

# Configure
require "../config/config"

# Controller
require "./modules/todos/controller/todo_controller"

Kemal.run
