require 'rubygems'
require 'minitest/autorun'
require 'bundler/setup'
require 'minitest/reporters'

reporter_options = {color: true}

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]
