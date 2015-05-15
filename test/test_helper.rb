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

def create_question(body)
  DataStore.execute("INSERT INTO questions (body) VALUES (?)", body)
end

def main_menu
  "Welcome to Flashcards!\n" +
  "Please choose from the following:\n" +
  ":\n" +
  "1. Play a new game\n" +
  "2. View score dashboard\n" +
  "3. Review missed questions\n" +
  "4. Administrator activities\n" +
  "5. Exit\n"
end

def admin_menu
  "Administrator Panel\n" +
  "Please choose from the following:\n" +
  ":\n" +
  "1. Add a new question\n" +
  "2. Edit an existing question\n" +
  "3. Delete a question\n" +
  "4. See a list of all current questions\n" +
  "5. Return to main menu\n"
end

def after_input
  "?  "
end
