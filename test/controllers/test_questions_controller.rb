require_relative "../test_helper"

describe QuestionsController do

  describe ".edit" do
    let(:controller) {QuestionsController.new}

    it "should be false if there are no questions to edit" do
      expected = false
      actual = controller.edit
      assert_equal expected, actual
    end

    describe "if there are questions" do |variable|
      before do
        create_question("One", "Two", "Three", "Four", "a", nil)
        create_question("Five", "Six", "Seven", "Eight", "b", nil)
        create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
      end
      it "should be true if there are in the database" do
        expected = true
        actual = controller.edit
        assert_equal expected, actual
      end
    end

  end

  describe ".add" do
    let(:controller) {QuestionsController.new}

    it "should add a question category" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 1, Question.count
    end

    it "should not add a question category all spaces" do
      category = "        "
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should only add a question category that makes sense" do
      category = "2 3 4 5 5"
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should not add a question body all spaces" do
      category = "javascript"
      body = "          "
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should only add a question body that makes sense" do
      category = "javascript"
      body = "7777777"
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should not add a question choiceA all spaces" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "          "
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should only add a question choiceA that makes sense" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "9 87 8 9 8"
      choiceB = "to add interactivity to HTML pages"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should not add a question choiceB all spaces" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "          "
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should only add a question choiceB that makes sense" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "203947289"
      answer = "b"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should not add a question answer all spaces" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "      "
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

    it "should only add a question answer that makes sense" do
      category = "javascript"
      body = "Javascript is designed for the following purpose"
      choiceA = "to style HTML pages"
      choiceB = "to add interactivity to HTML pages"
      answer = "1928474"
      controller.add(category, body, choiceA, choiceB, answer, nil)
      assert_equal 0, Question.count
    end

  end

  describe ".index" do
    let(:controller) {QuestionsController.new}

    it "should say no questions found when empty" do
      actual = controller.index
      expected = "No questions found.\n"
      assert_equal expected, actual
    end

    describe "if there are questions" do
      before do
        create_question("One", "Two", "Three", "Four", "a", nil)
        create_question("Five", "Six", "Seven", "Eight", "b", nil)
        create_question("Nine", "Ten", "Eleven", "Twelve", "a", nil)
      end

      it "should list the questions in the database" do
        actual = controller.index
        expected = ""
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
        assert_equal expected, actual
      end

    end

  end

end
