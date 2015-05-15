class Question
  attr_reader :id, :errors
  attr_accessor :name

  def initialize(name = nil)
    # self.name = name
  end

  def self.all
    # makes a new question out of each row in the database
    # sets the name to name
  end

  def self.count
  end

  def valid?
  end

  def save
  end

end
