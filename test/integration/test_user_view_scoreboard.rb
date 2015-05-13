require_relative '../test_helper'

class TestViewScoreboard < Minitest::Test
  def test_main_menu_option_2
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << "Welcome to Flashcards!\n"
      expected << "Please choose from the following:\n"
      expected << ":\n"
      expected << "1. Play a new game\n"
      expected << "2. View score dashboard\n"
      expected << "3. Review missed questions\n"
      expected << "4. Administrator activities\n"
      expected << "5. Exit\n"
      pipe.puts "2"
      expected << "?  Score Dashboard\n"
      expected << "Number of games played: 10\n"
      expected << "Average Score: 40%\n"
      expected << "Best Score: 100%\n"
      expected << "Enter 1 to go back\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end

# ##### View the Score Board
# ####### Usage Example
# In order to set goals on performance
# I want to view a summary of my scores over time
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
# $ 2
# ```
# > Score Dashboard
# > Number of games played: 10
# > Average Score: 40%
# > Best Score: 100%
# > Enter 1 to go back
# user inputs
# ```
# 1
# ```
# > Welcome to Flashcards!
# > Please choose from the following:
# > 1. Play a new game
# > 2. View score dashboard
# > 3. Review missed questions
# > 4. Administrator activities
# ####### Acceptance Criteria
# * The program runs and shows a main menu
# * The program outputs a score dashboard when prompted
# * User returns to the main menu
