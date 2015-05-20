class AttemptsController
  attr_accessor :questions

  def initialize
    questions = Question.all
    @questions = questions.sample(5)
  end

  def game
    @questions.each {|question| Attempt.new().choice(question)}
    if @questions.empty?
      say("There are no questions. You can add questions in the Admin Menu.")
    else
      say("Game over!")
    end
  end

end
