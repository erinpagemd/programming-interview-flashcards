class Question
  attr_reader :id, :errors
  attr_accessor :category, :body, :choice_a, :choice_b, :answer

  def initialize(category, body, choiceA, choiceB, answer)
    self.category = category
    self.body = body
    self.choice_a = choiceA
    self.choice_b = choiceB
    self.answer = answer

    if valid?(category) && valid?(body) && valid?(choice_a) && valid?(choice_b) && valid?(answer)
      DataStore.execute("INSERT INTO questions (category, body, choice_a, choice_b, answer) VALUES (?, ?, ?, ?, ?)", [@category, @body, @choice_a, @choice_b, @answer])
      # @id = DataStore.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
    else
      @errors = "I did not recognize that. Please try again."
    end
  end

  def self.all
    # makes a new question out of each row in the database
    # sets the name to name
  end

  def self.count
    DataStore.execute("SELECT count(id) from questions")[0][0]
  end

private

  def valid?(input)
    input = input.tr(" ", "")
    input = input.tr("0123456789", "")
    input = input.strip
    if input.nil? or input.empty?
      false
    else
      true
    end
  end

end
