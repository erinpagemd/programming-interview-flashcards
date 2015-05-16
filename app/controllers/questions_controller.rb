require "highline/import"

class QuestionsController
  def index
    # return all the questions currenty in the database
    "No questions found.\n"
  end

  def add(category, body, choiceA, choiceB, answer)
    category = category.strip
    body = body.strip
    question = Question.new(category, body, choiceA, choiceB, answer)
    # if scenario.save
    #   "\"#{name}\" has been added\n"
    # else
    #   question.errors
    # end
  end

end
