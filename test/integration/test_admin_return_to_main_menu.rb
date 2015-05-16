require_relative '../test_helper'

class TestReturnToMainMenu < Minitest::Test

  def test_admin_menu_option_5
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

end

# ##### Return to main menu
# ####### Usage Example
# In order to play the game instead of admin activities
# I want to return to the main menu
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
# 5
# ```
# > Welcome to Flashcards!
# > Please choose from the following:
# > 1. Play a new game
# > 2. View score dashboard
# > 3. Review missed questions
# > 4. Administrator activities
# ####### Acceptance Criteria
# * From the Administrator Panel, user returns to the main menu
