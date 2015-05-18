require "highline/import"

class QuestionsController
  def index
    if Question.count > 0
      questions_str = ""
      questions = Question.all
      questions = questions.each do |question|
        questions_str << "/////// Question ///////\n"
        questions_str << "Category: #{question.category}\n"
        questions_str << "Body: #{question.body}\n"
        questions_str << "Choice A: #{question.choice_a}\n"
        questions_str << "Choice B: #{question.choice_b}\n"
        questions_str << "Answer: #{question.answer}\n\n"
      end
      questions_str
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
