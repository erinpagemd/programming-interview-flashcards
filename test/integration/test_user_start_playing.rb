require_relative '../test_helper'

class TestUserStartNewGame < Minitest::Test
  def test_main_menu_option_1
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "1"
      expected << after_input
      expected << "Question 1 of 10\n"
      expected << "Score: 0\n"
      expected << "QuestionId: 5\n"
      expected << "Category: Ruby\n"
      expected << "Q: How does a symbol differ from a string?\n"
      expected << "a. Symbols are immutable and reusable, retaining the same object_id.\n"
      expected << "b. Strings are immutable and reusable, retaining the same object_id.\n"
      expected << "c. Symbols and strings do not differ.\n"
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
