require "highline/import"

class QuestionsController
  def index
    # return all the questions currenty in the database
    "No questions found.\n"
  end

  def add(body)
    body_cleaned = body.strip
    question = Question.new(body_cleaned)
    # if scenario.save
    #   "\"#{name}\" has been added\n"
    # else
    #   question.errors
    # end
  end

end
