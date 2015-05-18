require "highline/import"

class QuestionsController
  def index
    if Question.count > 0
      questions = Question.all
      questions.map{|question| question.id}
      questions
    else
      "No questions found.\n"
    end
  end

  def add(category, body, choiceA, choiceB, answer, id)
    if valid?(category) && valid?(body) && valid?(choiceA) && valid?(choiceB) && valid?(answer)
      question = Question.new(category, body, choiceA, choiceB, answer, id)
    end
  end

private

  def valid?(input)
    input = input.strip
    input_regex = /\s|\d/.match(input)
    if input.nil? or input.empty? or input === input_regex
      false
    else
      true
    end
  end


end
