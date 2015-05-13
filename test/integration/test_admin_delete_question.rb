require_relative '../test_helper'

class TestAdminDelete < Minitest::Test
  def test_admin_menu_option_3
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << "?  Administrator Panel\n"
      expected << "Please choose from the following:\n"
      expected << ":\n"
      expected << "1. Add a new question\n"
      expected << "2. Edit an existing question\n"
      expected << "3. Delete a question\n"
      expected << "4. See a list of all current questions\n"
      expected << "5. Return to main menu\n"
      pipe.puts "3"
      expected << "?  Delete a question\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end
end

# ##### Delete Question Unit
# ####### Usage Example
# In order to remove duplicate questions
# I want to delete a question from the database
# User inputs
# ```
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
# 3
# ```
# > QuestionId of question to delete
# User inputs
# ```
# 5
# ```
# > Question deleted!
# > Administrator Panel
# > Please choose from the following:
# > 1. Add a new question
# > 2. Edit an existing question
# > 3. Delete a question
# > 4. See a list of all current questions
# > 5. Return to main menu
# ####### Acceptance Criteria
# * From the Administrator Panel, user can choose to delete an existing question
# * Program prompts user for the QuestionId of the question to be deleted
# * User enters the corresponding QuestionId and the program deletes the question
# * User is returned to the Administrator Panel
