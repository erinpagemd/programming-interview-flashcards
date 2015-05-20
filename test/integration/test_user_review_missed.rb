require_relative '../test_helper'

class TestReviewMissedQuestions < Minitest::Test

  def test_main_menu_option_review_missed
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Review"
      expected << after_input
      expected << "Missed Questions\n"
      expected << "How does a symbol differ from a string?\n"
      expected << "Missed 4 times\n"
      expected << "Category: Ruby\n"
      expected << "Q: What is a Proc?\n"
      expected << "Missed 1 time\n"
      expected << "Category: Ruby\n"
      expected << "Enter 1 to go back\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end

# ##### Review Missed Questions
# ####### Usage Example
# In order to increase my knowledge base
# I want to familiarize myself with questions I previously missed
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
# $ 3
# ```
# > Missed Questions
# > Q: How does a symbol differ from a string?
# > Missed 4 times
# > Category: Ruby
# > Q: What is a Proc?
# > Missed 1 time
# > Category: Ruby
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
# * Program shows a main menu after running
# * Program outputs a list of missed questions when prompted
# * Program returns to the main menu
