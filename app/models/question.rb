class Question
  attr_accessor :category, :body, :choice_a, :choice_b, :answer, :id

  def initialize(category, body, choiceA, choiceB, answer, id)
    self.category = category
    self.body = body
    self.choice_a = choiceA
    self.choice_b = choiceB
    self.answer = answer
    self.id = id

    if @id.nil?
      save_question
    end

  end

  def self.all
    DataStore.execute("SELECT * FROM questions").map do |row|
      question = Question.new(row[1], row[2], row[3], row[4], row[5], row[0])
      question
    end
  end

  def self.count
    DataStore.execute("SELECT count(id) FROM questions")[0][0]
  end

  def update_category(category)
    DataStore.execute("UPDATE questions SET category=? WHERE id=?", category, id)
  end

  def update_body(body)
    DataStore.execute("UPDATE questions SET body=? WHERE id=?", body, id)
  end

  def update_choice_a(choice_a)
    DataStore.execute("UPDATE questions SET choice_a=? WHERE id=?", choice_a, id)
  end

  def update_choice_b(choice_b)
    DataStore.execute("UPDATE questions SET choice_b=? WHERE id=?", choice_b, id)
  end

  def update_answer(answer)
    DataStore.execute("UPDATE questions SET answer=? WHERE id=?", answer, id)
  end

  def delete
    DataStore.execute("DELETE FROM questions WHERE id=?", id)
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

  def save_question
    if valid?(@category) && valid?(@body) && valid?(@choice_a) && valid?(@choice_b) && valid?(@answer)
      DataStore.execute("INSERT INTO questions (category, body, choice_a, choice_b, answer) VALUES (?, ?, ?, ?, ?)", [@category, @body, @choice_a, @choice_b, @answer])
      @id = DataStore.execute("SELECT last_insert_rowid()")[0]
    else
      "I did not recognize that. Please try again."
    end
  end

end
