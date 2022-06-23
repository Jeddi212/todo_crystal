require "kemal"
require "./db/db_connection"

get "/" do
  conn = Connection.get_connection
  "#{typeof(conn).to_s} ::: OK"
end

Kemal.run