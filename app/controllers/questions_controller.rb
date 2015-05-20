require "highline/import"

class QuestionsController

  def edit
    if Question.count > 0
      questions = Question.all
      choose do |menu|
        questions.each do |question|
          menu.choice("Question: #{question.body}\n") {action_menu(question)}
        end
        menu.header = "***** Edit Question *****\n"
        menu.choice("Exit")
        menu.prompt = "Which question would you like to manipulate?"
      end
      true
    else
      say("No questions found.\n")
      false
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

  def edit_category(question)
    user_input = ask("Enter a new category:")
    question.category = user_input.strip
    question.update_category(question.category)
    say("Category updated to #{question.category}.")
  end

  def edit_body(question)
    user_input = ask("Enter a new body:")
    question.body = user_input.strip
    question.update_body(question.body)
    say("Body updated to #{question.body}.")
  end

  def edit_choice_a(question)
    user_input = ask("Enter a new Choice A:")
    question.choice_a = user_input.strip
    question.update_choice_a(question.choice_a)
    say("Choice A updated to #{question.choice_a}.")
  end

  def edit_choice_b(question)
    user_input = ask("Enter a new Choice B:")
    question.choice_b = user_input.strip
    question.update_choice_b(question.choice_b)
    say("Choice B updated to #{question.choice_b}.")
  end

  def edit_answer(question)
    user_input = ask("Enter the correct answer:")
    question.answer = user_input.strip
    question.update_answer(question.answer)
    say("Answer updated to #{question.answer}.")
  end

  def action_menu(question)
    say("***********\nWould you like to?")
    choose do |menu|
      menu.choice("Edit") do
        choose do |menu|
          menu.prompt = "What part of the question would you like to edit?"
          menu.header = "**********\nEdit Options"
          menu.choice("Category: #{question.category}"){edit_category(question)}
          menu.choice("Body: #{question.body}"){edit_body(question)}
          menu.choice("Choice A: #{question.choice_a}"){edit_choice_a(question)}
          menu.choice("Choice B: #{question.choice_b}"){edit_choice_b(question)}
          menu.choice("Answer: #{question.answer}"){edit_answer(question)}
          menu.choice("Exit") do
            exit
          end
        end
      end
      menu.choice("Delete") do
        question.delete
        say("Question deleted.")
      end
      menu.choice("Exit") do
        exit
      end
    end
  end


end
