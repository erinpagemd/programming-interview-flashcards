require_relative '../test_helper'

class TestEditQuestion < Minitest::Test

  def test_admin_menu_option_delete_without_questions
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "No questions found.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_admin_menu_option_edit_with_quesitons_edit_category
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "***** Edit Question *****\n"
      expected << ":\n"
      expected << "1. Question: Two\n\n"
      expected << "2. Question: Six\n\n"
      expected << "3. Question: Ten\n\n"
      expected << "4. Exit\n"
      expected << "Which question would you like to manipulate?\n"
      pipe.puts "1"
      expected << "***********\nWould you like to?\n"
      expected << "1. Edit\n"
      expected << "2. Delete\n"
      expected << "3. Exit\n"
      pipe.puts "Edit"
      expected << after_input
      expected << "**********\nEdit Options:\n"
      expected << "1. Category: One\n"
      expected << "2. Body: Two\n"
      expected << "3. Choice A: Three\n"
      expected << "4. Choice B: Four\n"
      expected << "5. Answer: a\n"
      expected << "6. Exit\n"
      expected << "What part of the question would you like to edit?\n"
      pipe.puts "Category"
      expected << "Enter a new category:\n"
      pipe.puts "Thirty eleven"
      expected << "Category updated to Thirty eleven.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output

  end

  def test_admin_menu_option_edit_with_questions_edit_body
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "***** Edit Question *****\n"
      expected << ":\n"
      expected << "1. Question: Two\n\n"
      expected << "2. Question: Six\n\n"
      expected << "3. Question: Ten\n\n"
      expected << "4. Exit\n"
      expected << "Which question would you like to manipulate?\n"
      pipe.puts "1"
      expected << "***********\nWould you like to?\n"
      expected << "1. Edit\n"
      expected << "2. Delete\n"
      expected << "3. Exit\n"
      pipe.puts "Edit"
      expected << after_input
      expected << "**********\nEdit Options:\n"
      expected << "1. Category: One\n"
      expected << "2. Body: Two\n"
      expected << "3. Choice A: Three\n"
      expected << "4. Choice B: Four\n"
      expected << "5. Answer: a\n"
      expected << "6. Exit\n"
      expected << "What part of the question would you like to edit?\n"
      pipe.puts "Body"
      expected << "Enter a new body:\n"
      pipe.puts "Thirty eleven"
      expected << "Body updated to Thirty eleven.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output

  end

  def test_admin_menu_option_edit_with_questions_edit_choice_a
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "***** Edit Question *****\n"
      expected << ":\n"
      expected << "1. Question: Two\n\n"
      expected << "2. Question: Six\n\n"
      expected << "3. Question: Ten\n\n"
      expected << "4. Exit\n"
      expected << "Which question would you like to manipulate?\n"
      pipe.puts "1"
      expected << "***********\nWould you like to?\n"
      expected << "1. Edit\n"
      expected << "2. Delete\n"
      expected << "3. Exit\n"
      pipe.puts "Edit"
      expected << after_input
      expected << "**********\nEdit Options:\n"
      expected << "1. Category: One\n"
      expected << "2. Body: Two\n"
      expected << "3. Choice A: Three\n"
      expected << "4. Choice B: Four\n"
      expected << "5. Answer: a\n"
      expected << "6. Exit\n"
      expected << "What part of the question would you like to edit?\n"
      pipe.puts "Choice A"
      expected << "Enter a new Choice A:\n"
      pipe.puts "Thirty eleven"
      expected << "Choice A updated to Thirty eleven.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output

  end

  def test_admin_menu_option_edit_with_questions_edit_choice_b
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "***** Edit Question *****\n"
      expected << ":\n"
      expected << "1. Question: Two\n\n"
      expected << "2. Question: Six\n\n"
      expected << "3. Question: Ten\n\n"
      expected << "4. Exit\n"
      expected << "Which question would you like to manipulate?\n"
      pipe.puts "1"
      expected << "***********\nWould you like to?\n"
      expected << "1. Edit\n"
      expected << "2. Delete\n"
      expected << "3. Exit\n"
      pipe.puts "Edit"
      expected << after_input
      expected << "**********\nEdit Options:\n"
      expected << "1. Category: One\n"
      expected << "2. Body: Two\n"
      expected << "3. Choice A: Three\n"
      expected << "4. Choice B: Four\n"
      expected << "5. Answer: a\n"
      expected << "6. Exit\n"
      expected << "What part of the question would you like to edit?\n"
      pipe.puts "Choice B"
      expected << "Enter a new Choice B:\n"
      pipe.puts "Thirty eleven"
      expected << "Choice B updated to Thirty eleven.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output

  end

  def test_admin_menu_option_edit_with_questions_edit_answer
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "***** Edit Question *****\n"
      expected << ":\n"
      expected << "1. Question: Two\n\n"
      expected << "2. Question: Six\n\n"
      expected << "3. Question: Ten\n\n"
      expected << "4. Exit\n"
      expected << "Which question would you like to manipulate?\n"
      pipe.puts "1"
      expected << "***********\nWould you like to?\n"
      expected << "1. Edit\n"
      expected << "2. Delete\n"
      expected << "3. Exit\n"
      pipe.puts "Edit"
      expected << after_input
      expected << "**********\nEdit Options:\n"
      expected << "1. Category: One\n"
      expected << "2. Body: Two\n"
      expected << "3. Choice A: Three\n"
      expected << "4. Choice B: Four\n"
      expected << "5. Answer: a\n"
      expected << "6. Exit\n"
      expected << "What part of the question would you like to edit?\n"
      pipe.puts "Answer"
      expected << "Enter the correct answer:\n"
      pipe.puts "b"
      expected << "Answer updated to b.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
      expected << main_menu
      pipe.puts "Exit"
      expected << after_input
      expected << "Closing program\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output

  end

  def test_edit_wrong_input
  end

  def test_action_menu_wrong_input
  end

  def test_admin_menu_option_delete_with_questions
    create_question("One", "Two", "Three", "Four", "a", nil)
    create_question("Five", "Six", "Seven", "Eight", "b", nil)
    create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
    shell_output = ""
    expected = ""
    IO.popen('./flash_cards', 'r+') do |pipe|
      expected << main_menu
      pipe.puts "Admin"
      expected << after_input
      expected << admin_menu
      pipe.puts "Edit"
      expected << after_input
      expected << "***** Edit Question *****\n:\n"
      expected << "1. Question: Two\n\n"
      expected << "2. Question: Six\n\n"
      expected << "3. Question: Ten\n\n"
      expected << "4. Exit\n"
      expected << "Which question would you like to manipulate?\n"
      pipe.puts "1"
      expected << "***********\nWould you like to?\n"
      expected << "1. Edit\n"
      expected << "2. Delete\n"
      expected << "3. Exit\n"
      pipe.puts "Delete"
      expected << after_input
      expected << "Question deleted.\n"
      expected << admin_menu
      pipe.puts "Return"
      expected << after_input
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
