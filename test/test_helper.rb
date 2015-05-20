require 'rubygems'
require 'minitest/autorun'
require 'bundler/setup'
require 'minitest/reporters'
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

class Minitest::Test
  def setup
    DataStore.load_structure
    DataStore.execute("DELETE FROM questions")
  end
end

def create_question(category, body, choiceA, choiceB, answer, id)
  DataStore.execute("INSERT INTO questions (category, body, choice_a, choice_b, answer) VALUES (?, ?, ?, ?, ?)", [category, body, choiceA, choiceB, answer])
end

def main_menu
  "**********************************\n" +
  "***** Welcome to Flashcards! *****\n" +
  "**********************************\n" +
  "Please choose from the following:\n" +
  ":\n" +
  "1. Play a new game\n" +
  "2. Review missed questions\n" +
  "3. Administrator activities\n" +
  "4. Exit\n"
end

def admin_menu
  "*******************************\n" +
  "***** Administrator Panel *****\n" +
  "*******************************\n" +
  "Please choose from the following:\n" +
  ":\n" +
  "1. Add a new question\n" +
  "2. Edit or Delete an existing question\n" +
  "3. See a list of all current questions\n" +
  "4. Return to main menu\n"
end

def after_input
  "?  "
end
