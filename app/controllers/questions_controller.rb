require "highline/import"

class QuestionsController

  def edit
    if Question.count > 0
      questions = Question.all
      choose do |menu|
        questions.each do |question|
          menu.choice("Question: #{question.body}\n") {action_menu(question)}
        end
        menu.choice("Exit")
        menu.prompt = "Which question would you like to manipulate?"
      end
    else
      say("No questions found.\n")
    end
  end

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

  def action_menu(question)
    say("Would you like to?")
    choose do |menu|
      menu.choice("Edit") do
        choose do |menu|
          menu.prompt = "What part of the question would you like to edit?"
          menu.choice("Category: #{question.category}")
          menu.choice("Body: #{question.body}")
          menu.choice("Choice A: #{question.choice_a}")
          menu.choice("Choice B: #{question.choice_b}")
          menu.choice("Answer: #{question.answer}")
          menu.choice("Exit") do
            exit
          end
        end
      end
      menu.choice("Delete") do
        "Delete now!!"
      end
      menu.choice("Exit") do
        exit
      end
    end
  end


end
