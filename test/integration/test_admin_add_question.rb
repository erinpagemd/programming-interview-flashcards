require_relative '../test_helper'

class TestAdminAdd < Minitest::Test

  def test_wrong_number_argv
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards oneArg', 'r+') do |pipe|
      expected << "run with './flash_cards'\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_wrong_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "10"
      expected << after_input
      expected << "You must choose one of [1, 2, 3, 4, 5, Play a new game, View score dashboard, Review missed questions, Administrator activities, Exit].\n"
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_space_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts " "
      expected << after_input
      expected << "Ambiguous choice.  Please choose one of [1, 2, 3, 4, 5, Play a new game, View score dashboard, Review missed questions, Administrator activities, Exit].\n"
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_no_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts ""
      expected << "?  Ambiguous choice.  Please choose one of [1, 2, 3, 4, 5, Play a new game, View score dashboard, Review missed questions, Administrator activities, Exit].\n"
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_option_4
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_admin_menu_option_1
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_admin_menu_no_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts ""
      expected << after_input
      expected << "Ambiguous choice.  Please choose one of [1, 2, 3, 4, 5, Add a new question, Edit an existing question, Delete a question, See a list of all current questions, Return to main menu].\n"
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts "css"
      expected << "What is the body of the question?\n"
      pipe.puts "The id selector is used to specify a style for:"
      expected << "What is choice A for this question?\n"
      pipe.puts "single, common element"
      expected << "What is choice B for this question?\n"
      pipe.puts "single, unique element"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "b"
      expected << "Question:\n"
      expected << "category: css\n"
      expected << "body: The id selector is used to specify a style for:\n"
      expected << "choice A: single, common element\n"
      expected << "choice B: single, unique element\n"
      expected << "answer: b\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output

  end

  def test_admin_menu_wrong_input
    skip
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "90"
      expected << after_input
      expected << "You must choose one of [1, 2, 3, 4, 5, Add a new question, Edit an existing question, Delete a question, See a list of all current quesitons, Return to main menu].\n"
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_add_question_category_no_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts ""
      expected << "Please enter a valid category\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_add_question_category_multiple_no_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts ""
      expected << "Please enter a valid category\n"
      pipe.puts ""
      expected << "Please enter a valid category\n"
      pipe.puts ""
      expected << "Please enter a valid category\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_add_question_body_incorrect_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts ""
      expected << "Please enter a valid question body\n"
      pipe.puts ""
      expected << "Please enter a valid question body\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_add_question_choiceA_incorrect_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts ""
      expected << "Please enter a valid choice A\n"
      pipe.puts ""
      expected << "Please enter a valid choice A\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_add_question_choiceB_incorrect_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts ""
      expected << "Please enter a valid choice B\n"
      pipe.puts ""
      expected << "Please enter a valid choice B\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_add_question_answer_incorrect_input
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << admin_menu
      pipe.puts "1"
      expected << after_input
      expected << "What is the category of the question?\n"
      pipe.puts "Ruby"
      expected << "What is the body of the question?\n"
      pipe.puts "What is a hash?"
      expected << "What is choice A for this question?\n"
      pipe.puts "An object"
      expected << "What is choice B for this question?\n"
      pipe.puts "A string"
      expected << "What is the correct answer for this question?\n"
      pipe.puts ""
      expected << "Please enter a or b\n"
      pipe.puts "A"
      expected << "Question:\n"
      expected << "category: Ruby\n"
      expected << "body: What is a hash?\n"
      expected << "choice A: An object\n"
      expected << "choice B: A string\n"
      expected << "answer: A\n"
      expected << admin_menu
      pipe.puts "5"
      expected << after_input
      expected << main_menu
      pipe.puts "5"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end


# ####### Usage Example
# In order to keep the game fresh
# I want to add new questions to the game.
# ####### Acceptance Criteria
# User inputs
# $ Flashcards
# ```
# > Welcome to Flashcards!
# > Please choose from the following:
# > 1. Play a new game
# > 2. View score dashboard
# > 3. Review missed questions
# > 4. Administrator activities
# User inputs
# ```
# $ 4
# ```
# > Administrator Panel
# > Please choose from the following:
# > 1. Add a new question
# > 2. Edit an existing question
# > 3. Delete a question
# > 4. See a list of all current questions
# > 5. Return to main menu
# User inputs
# ```
# 1
# ```
# > Add a question!
# > What category is this question (ruby, css, javascript, etc)?
# User inputs
# ```
# ruby
# ```
# > Please enter the question.
# User inputs
# ```
# How does a symbol differ from a string?
# ```
# > What is response choice 'a' for this question?
# User inputs
# ```
# Symbols are immutable and reusable, retaining the same object_id.
# ```
# > What is response choice 'b' for this question?
# User inputs
# ```
# Strings are immutable and reusable, retaining the same object_id.
# ```
# > What is response choice 'c' for this question?
# User inputs
# ```
# Symbols and strings do not differ.
# ```
# > What is the correct response choice for this question (a,b,c)?
# User inputs
# ```
# a
# ```
# > New question added!!
# > Administrator Panel
# > Please choose from the following:
# > 1. Add a new question
# > 2. Edit an existing question
# > 3. Delete a question
# > 4. See a list of all current questions
# > 5. Return to main menu
