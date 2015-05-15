require "highline/import"

class QuestionsController
  def index
    # return all the questions currenty in the database
    "No questions found.\n"
  end

  def add(body)
  end

  # def add(name)
  #   # add a new question??
  #   name_cleaned = name.strip
  #   question = Question.new(name_cleaned)
  #   if scenario.save
  #     "\"#{name}\" has been added\n"
  #   else
  #     question.errors
  #   end
  # end

end
