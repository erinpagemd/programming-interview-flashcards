require "highline/import"

class QuestionsController
  def index
    if Question.count > 0
      "here is a list of questions"
    else
      "No questions found.\n"
    end
  end

  def add(category, body, choiceA, choiceB, answer)
    if valid?(category) && valid?(body) && valid?(choiceA) && valid?(choiceB) && valid?(answer)
      question = Question.new(category, body, choiceA, choiceB, answer)
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
