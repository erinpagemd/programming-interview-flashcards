require 'sqlite3'

# where are tests for this??

class DataStore

  def self.load_structure
    @@db = SQLite3::Database.new("db/flash_cards_test.sqlite")
    @@db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS questions (
      id integer PRIMARY KEY AUTOINCREMENT,
      body varchar(255) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = ENV["TEST"] ? "test" : "production"
    database= "db/flash_cards_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    # @@db.results_as_hash = true
  end

end
