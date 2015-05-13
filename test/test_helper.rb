require 'rubygems'
require 'minitest/autorun'
require 'bundler/setup'
require 'minitest/reporters'
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }


reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

def main_menu
end
