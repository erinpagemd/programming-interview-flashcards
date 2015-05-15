class Question
  attr_reader :id, :errors
  attr_accessor :body

  def initialize(body) # = nil
    self.body = body
    if body.nil? or body.empty? or /^\d/.match(body)
      @errors = "Not a valid question body."
    else
      DataStore.execute("INSERT INTO questions (body) VALUES (?)", body)
      # @id = DataStore.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
    end
  end

  def self.all
    # makes a new question out of each row in the database
    # sets the name to name
  end

  def self.count
    DataStore.execute("SELECT count(id) from questions")[0][0]
  end

  # def valid?
  #   if name.nil? or name.empty? or /^\d_$/.match(name)
  #     @errors = "\"#{name}" is not a valid question."
  #     false
  #   else
  #     @errors = nil
  #     true
  #   end
  # end

  def save
    # return false unless valid?
    # Database.execute("INSERT INTO questions (name) VALUES (?)", name)
    # @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end

end
