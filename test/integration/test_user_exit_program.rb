require_relative '../test_helper'

class TestExitProgram < Minitest::Test
  def test_main_menu_option_5
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
      pipe.puts "5"
      expected << "?  Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end

# ####### Exit the program
# In order to exit the program
# I want to close the program
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
# > 5. Exit
# User inputs
# ```
# $ 5
# ```
# > Closing program
# ####### Acceptance Criteria
# * The program stops exits
