require_relative '../test_helper'

class TestAdminReviewAllQuestions < Minitest::Test
  def test_admin_menu_option_3_no_questions
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "3"
      expected << after_input
      expected << admin_menu
      pipe.puts "3"
      expected << after_input
      expected << "No questions found.\n"
      expected << admin_menu
      pipe.puts "4"
      expected << after_input
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_admin_menu_option_3_with_questions
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "3"
      expected << after_input
      expected << admin_menu
      pipe.puts "3"
      expected << after_input
      expected << "/////// Question ///////\n"
      expected << "Category: One\n"
      expected << "Body: Two\n"
      expected << "Choice A: Three\n"
      expected << "Choice B: Four\n"
      expected << "Answer: a\n\n"
      expected << "/////// Question ///////\n"
      expected << "Category: Five\n"
      expected << "Body: Six\n"
      expected << "Choice A: Seven\n"
      expected << "Choice B: Eight\n"
      expected << "Answer: b\n\n"
      expected << "/////// Question ///////\n"
      expected << "Category: Nine\n"
      expected << "Body: Ten\n"
      expected << "Choice A: Eleven\n"
      expected << "Choice B: Twelve\n"
      expected << "Answer: a\n\n"
      expected << admin_menu
      pipe.puts "4"
      expected << after_input
      expected << main_menu
      pipe.puts "4"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end

# ##### Review all questions
# ####### Usage Example
# In order to find QuestionId of the question it edit or delete
# I want to review of a list of all questions and their answers
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
# 4
# ```
# > list of questions shows with Q, Answers, Correct, Category
# > Administrator Panel
# > Please choose from the following:
# > 1. Add a new question
# > 2. Edit an existing question
# > 3. Delete a question
# > 4. See a list of all current questions
# > 5. Return to main menu
# ####### Acceptance Criteria
# * From the Administrator Panel, user can choose to see a list of all questions
# * Program outputs a list of each question containing: question body, each choice, correct answer, category
# * User is returned to the Administrator Panel
