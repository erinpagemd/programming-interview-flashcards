class Question
  attr_accessor :category, :body, :choice_a, :choice_b, :answer
  attr_reader :id

  def initialize(category, body, choiceA, choiceB, answer)
    self.category = category
    self.body = body
    self.choice_a = choiceA
    self.choice_b = choiceB
    self.answer = answer

    if valid?(category) && valid?(body) && valid?(choice_a) && valid?(choice_b) && valid?(answer)
      DataStore.execute("INSERT INTO questions (category, body, choice_a, choice_b, answer) VALUES (?, ?, ?, ?, ?)", [@category, @body, @choice_a, @choice_b, @answer])
      @id = DataStore.execute("SELECT last_insert_rowid()")[0]
    else
      "I did not recognize that. Please try again."
    end
  end

  def self.all
    DataStore.execute("SELECT * FROM questions").map do |row|
      question = Question.new(row[1], row[2], row[3], row[4], row[5])
      question
    end
  end

  def self.count
    DataStore.execute("SELECT count(id) FROM questions")[0][0]
  end

private

  def valid?(input)
    input = input.to_s
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
