require_relative '../test_helper'

describe Question do

  describe "#all" do
  end

  describe "#count" do
    describe "if there are no questions in the database" do
      it "should return 0" do
        assert_equal 0, Question.count
      end
    end
    describe "if there are questions" do
      before do
        create_question("Bob")
        create_question("Sally")
        create_question("Amanda")
      end
      it "should return the correct count" do
        assert_equal 3, Question.count
      end
    end
  end

  describe ".initialize" do
    it "sets the body attribute" do
      question = Question.new('foo')
      assert_equal "foo", question.body
    end
  end

  describe ".save" do
  end

  describe ".valid?" do
  end

  describe ".update" do
  end

end
