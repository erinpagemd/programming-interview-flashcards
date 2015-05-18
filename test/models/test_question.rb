require_relative '../test_helper'

describe Question do

  describe "#all" do
    describe "if there are no scenarios in the database" do
      it "should return an empty array" do
        assert_equal [], Question.all
      end
    end

    describe "if there are questions" do
      before do
        create_question("One", "Two", "Three", "Four", "a")
        create_question("Five", "Six", "Seven", "Eight", "b")
        create_question("Nine", "Ten", "Eleven", "Twelve", "a")
      end
      it "should return the question category" do
        expected = ["One", "Five", "Nine"]
        actual = Question.all.map{|question| question.category}
        assert_equal expected, actual
      end
      it "should return the question body" do
        expected =["Two", "Six", "Ten"]
        actual = Question.all.map{|question| question.body}
        assert_equal expected, actual
      end
      it "should return the question choice_a" do
        expected = ["Three", "Seven", "Eleven"]
        actual = Question.all.map{|question| question.choice_a}
        assert_equal expected, actual
      end
      it "should return the question choice_b" do
        expected = ["Four", "Eight", "Twelve"]
        actual = Question.all.map{|question| question.choice_b}
        assert_equal expected, actual
      end
      it "should return the question answer" do
        expected = ["a", "b", "a"]
        actual = Question.all.map{|question| question.answer}
        assert_equal expected, actual
      end
    end
  end

  describe "#count" do
    describe "if there are no questions in the database" do
      it "should return 0" do
        assert_equal 0, Question.count
      end
    end
    describe "if there are questions" do
      before do
        category1 = "ruby"
        body1 = "two one"
        choiceA1 = "three one"
        choiceB1 = "four one"
        answer1 = "b"
        category2 = "ruby"
        body2 = "two two"
        choiceA2 = "three two"
        choiceB2 = "four two"
        answer2 = "a"
        category3 = "one three"
        body3 = "two three"
        choiceA3 = "three three"
        choiceB3 = "four three"
        answer3 = "b"

        create_question(category1, body1, choiceA1, choiceB1, answer1)
        create_question(category2, body2, choiceA2, choiceB2, answer2)
        create_question(category3, body3, choiceA3, choiceB3, answer3)
      end
      it "should return the correct count" do
        assert_equal 3, Question.count
      end
    end
  end

  describe ".initialize" do
    it "sets the category attribute" do
      category = "one"
      body = "two"
      choiceA = "three"
      choiceB = "four"
      answer = "b"
      question = Question.new(category, body, choiceA, choiceB, answer)
      assert_equal "one", question.category
    end

    it "sets the body attribute" do
      category = "one"
      body = "two"
      choiceA = "three"
      choiceB = "four"
      answer = "b"
      question = Question.new(category, body, choiceA, choiceB, answer)
      assert_equal "two", question.body
    end

    it "sets the choice_a attribute" do
      category = "one"
      body = "two"
      choiceA = "three"
      choiceB = "four"
      answer = "b"
      question = Question.new(category, body, choiceA, choiceB, answer)
      assert_equal "three", question.choice_a
    end

    it "sets the choice_b attribute" do
      category = "one"
      body = "two"
      choiceA = "three"
      choiceB = "four"
      answer = "b"
      question = Question.new(category, body, choiceA, choiceB, answer)
      assert_equal "four", question.choice_b
    end

    it "sets the answer attribute" do
      category = "one"
      body = "two"
      choiceA = "three"
      choiceB = "four"
      answer = "b"
      question = Question.new(category, body, choiceA, choiceB, answer)
      assert_equal "b", question.answer
    end
  end

  describe ".save" do
  end

  describe ".update" do
  end

end
