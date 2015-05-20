class Attempt
  attr_accessor :points, :question

  def choice(question)
    @question = question
    choose do |menu|
      menu.header = "********************************\n***** Question: #{question.category} *****\n********************************\n#{question.body}"
      menu.choice("#{question.choice_a}"){verify(question, "a")}
      menu.choice("#{question.choice_b}"){verify(question, "b")}
    end
  end


  def verify(question, answer)
    if question.answer == answer
      say("CORRECT!!")
      true
    else
      say("INCORRECT")
      false
    end
  end

end
