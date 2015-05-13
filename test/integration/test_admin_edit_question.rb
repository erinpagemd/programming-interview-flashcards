require_relative '../test_helper'

class TestEditQuestion < Minitest::Test

  def test_admin_menu_option_2
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "4"
      expected << "?  "
      expected << admin_menu
      pipe.puts "2"
      expected << "?  Edit an existing question\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end

# ##### Edit Question Unit
# ####### Usage Example
# In order to correct an improper question category
# I want to change the category in the database
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
# 2
# ```
# > QuestionId of question to edit
# User inputs
# ```
# 5
# ```
# > Part of question to edit (Category, Q, A, B, C, Correct)
# User inputs
# ```
# Category
# ```
# > What is the new category for this question?
# User inputs
# ```
# ruby
# ```
# > Question edited!
# > Administrator Panel
# > Please choose from the following:
# > 1. Add a new question
# > 2. Edit an existing question
# > 3. Delete a question
# > 4. See a list of all current questions
# > 5. Return to main menu
# ####### Acceptance Criteria
# * From the Administrator Panel, user can select to edit an existing question
# * Program prompts user for QuestionId and part of the question to edit
# * Program edits the question and returns to the Administrator Panel
