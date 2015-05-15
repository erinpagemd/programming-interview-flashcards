require_relative "../test_helper"

describe QuestionsController do

  describe ".add" do
    let(:controller) {QuestionsController.new}

    it "should add a question body" do
      controller.add("Javascript is designed for the following purpose")
      # a. to style html pages
      # b. to execute query related to db on server
      # C. to add interactivity to html pages
      # d. to perform server side scripting opertion
      assert_equal 1, Question.count
    end

    it "should not add a question body all spaces" do
      controller.add("          ")
      assert_equal 0, Question.count
    end

    it "should only add a question body that makes sense" do
      controller.add("7777777")
      assert_equal 0, Question.count
    end
  end

  # describe ".index" do
  #   let(:controller) {QuestionsController.new}
  #
  #   it "should say no questions found when empty" do
  #     actual = controller.index
  #     expected = "No questions found.\n"
  #     assert_equal expected, actual
  #   end
  #
  #   it "should list the questions in the database" do
  #     actual = controller.index
  #     expected = "Here is a list of questions"
  #     assert_equal expected, actual
  #   end
  # end
end
