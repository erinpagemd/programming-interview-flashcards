class AttemptsController
  attr_accessor :questions

  def initialize
    questions = Question.all
    @questions = questions.sample(5)
  end

  def game
    @questions.each {|question| Attempt.new().choice(question)}
    say("Game over!")
  end

end
