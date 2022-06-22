require "db"
require "pg"

class DatabaseConn
    property connection : DB::Connection
   
    def initialize
        @connection = DB.connect("postgres://postgres:@localhost:5400/todo_list")
    end

    def self.instance
        @@instance ||= DatabaseConn.new
    end
end

module Connection
    def self.get_connection
        DatabaseConn.instance.connection
    end
end
