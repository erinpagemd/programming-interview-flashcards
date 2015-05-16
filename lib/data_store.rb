require 'sqlite3'

# where are tests for this??

class DataStore

  def self.load_structure
    environment = ENV["TEST"] ? "test" : "production"
    database= "db/flash_cards_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    @@db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS questions (
      id integer PRIMARY KEY AUTOINCREMENT,
      category varchar(255) NOT NULL,
      body varchar(255) NOT NULL,
      choice_a varchar(255) NOT NULL,
      choice_b varchar(255) NOT NULL,
      answer varchar(10) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    load_structure unless defined?(@@db)
    @@db.execute(*args)
  end

end
