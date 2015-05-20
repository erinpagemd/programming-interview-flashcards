require_relative '../test_helper'

class TestUserStartNewGame < Minitest::Test

  def test_main_menu_option_start_game_no_questions
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Play"
      expected << after_input
      expected << "There are no questions. You can add questions in the Admin Menu.\n"
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_option_start_game_with_question_happy_path
    create_question("One", "Two", "Three", "Four", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Play"
      expected << after_input
      expected << "********************************\n***** Question: One *****\n********************************\n"
      expected << "Two:\n"
      expected << "1. Three\n"
      expected << "2. Four\n"
      pipe.puts "1"
      expected << after_input
      expected << "CORRECT!!\n"
      expected << "Game over!\n"
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_option_start_game_with_question_no_input_for_answer_then_incorrect_answer
    create_question("One", "Two", "Three", "Four", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Play"
      expected << after_input
      expected << "********************************\n***** Question: One *****\n********************************\n"
      expected << "Two:\n"
      expected << "1. Three\n"
      expected << "2. Four\n"
      pipe.puts ""
      expected << after_input
      expected << "Ambiguous choice.  Please choose one of [1, 2, Three, Four].\n"
      pipe.puts "2"
      expected << after_input
      expected << "INCORRECT\n"
      expected << "Game over!\n"
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_option_start_game_with_question_space_input_for_answer_then_correct_answer
    create_question("One", "Two", "Three", "Four", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Play"
      expected << after_input
      expected << "********************************\n***** Question: One *****\n********************************\n"
      expected << "Two:\n"
      expected << "1. Three\n"
      expected << "2. Four\n"
      pipe.puts " "
      expected << after_input
      expected << "Ambiguous choice.  Please choose one of [1, 2, Three, Four].\n"
      pipe.puts "1"
      expected << after_input
      expected << "CORRECT!!\n"
      expected << "Game over!\n"
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_main_menu_option_start_game_with_question_unsatisfactory_input_for_answer_then_correct_answer
    create_question("One", "Two", "Three", "Four", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Play"
      expected << after_input
      expected << "********************************\n***** Question: One *****\n********************************\n"
      expected << "Two:\n"
      expected << "1. Three\n"
      expected << "2. Four\n"
      pipe.puts "14"
      expected << after_input
      expected << "You must choose one of [1, 2, Three, Four].\n"
      pipe.puts "1"
      expected << after_input
      expected << "CORRECT!!\n"
      expected << "Game over!\n"
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end



end

# ### User: Game Player
# As a junior programmer looking for a job
# In order to perform well at programming interviews
# I want to practice potential interview questions and review/track my results
# #### Scenarios
# ##### Start Playing
# ####### Usage Example
# In order to start a game
# I want to go to the console, run the program, and choose to start a new game
# Open the terminal and cd into the game directory.
# User inputs
# ```
# $ ./flash_cards
# ```
# > Welcome to Flashcards!
# > Please choose from the following:
# > 1. Play a new game
# > 2. View score dashboard
# > 3. Review missed questions
# > 4. Administrator activities
# User inputs
# ```
# $ 1
# ```
# > Question 1 of 10
# > Score: 0
# > QuestionId: 5
# > Category: Ruby
# > Q: How does a symbol differ from a string?
# > a. Symbols are immutable and reusable, retaining the same object_id.
# > b. Strings are immutable and reusable, retaining the same object_id.
# > c. Symbols and strings do not differ.
# ####### Acceptance Criteria
# * When the program is run, it shows a main menu
# * After selecting to play a game from the menu, the program shows the first question.
