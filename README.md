# programming-interview-flashcards



## Project Vision

Interactive command line program written in Ruby with a SQLite database.

Users will be able to answer questions, review a score board, see a list of missed questions.

## Features

* Playing a round of the game
* View score board
* View missed questions
* Score is kept while playing game
* Ability to edit the game (edit/delete/add questions and answers)

## User Stories

### User: Game Player

As a junior programmer looking for a job

In order to perform well at programming interviews

I want to practice potential interview questions and review/track my results

#### Scenarios

##### Start Playing

####### Usage Example

In order to start a game

I want to go to the console, run the program, and choose to start a new game

Open the terminal and cd into the game directory.

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 1
```

> Question 1 of 10

> Score: 0

> QuestionId: 5

> Category: Ruby

> Q: How does a symbol differ from a string?

> a. Symbols are immutable and reusable, retaining the same object_id.

> b. Strings are immutable and reusable, retaining the same object_id.

> c. Symbols and strings do not differ.

####### Acceptance Criteria

* When the program is run, it shows a main menu

* After selecting to play a game from the menu, the program shows the first question.


##### View the Score Board

####### Usage Example

In order to set goals on performance

I want to view a summary of my scores over time

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 2
```

> Score Dashboard

> Number of games played: 10

> Average Score: 40%

> Best Score: 100%

> Enter 1 to go back

user inputs
```
1
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

####### Acceptance Criteria

* The program runs and shows a main menu

* The program outputs a score dashboard when prompted

* User returns to the main menu

##### Review Missed Questions

####### Usage Example

In order to increase my knowledge base

I want to familiarize myself with questions I previously missed

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 3
```

> Missed Questions

> Q: How does a symbol differ from a string?

> Missed 4 times

> Category: Ruby

> Q: What is a Proc?

> Missed 1 time

> Category: Ruby

> Enter 1 to go back

user inputs
```
1
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

####### Acceptance Criteria

* Program shows a main menu after running

* Program outputs a list of missed questions when prompted

* Program returns to the main menu

####### Exit the program

In order to exit the program

I want to close the program

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

> 5. Exit

User inputs
```
$ 5
```

> Closing program


####### Acceptance Criteria

* The program stops exits


### User: Administrator

As an administrator of the game

In order to improve readability and user experience

I want to add, edit, and delete the questions, answers, and expected responses.

#### Scenarios

##### Add Question Unit

####### Usage Example

In order to keep the game fresh

I want to add new questions to the game.

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 4
```

> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

User inputs
```
1
```

> Add a question!

> What category is this question (ruby, css, javascript, etc)?

User inputs
```
ruby
```

> Please enter the question.

User inputs
```
How does a symbol differ from a string?
```

> What is response choice 'a' for this question?

User inputs
```
Symbols are immutable and reusable, retaining the same object_id.
```

> What is response choice 'b' for this question?

User inputs
```
Strings are immutable and reusable, retaining the same object_id.
```

> What is response choice 'c' for this question?

User inputs
```
Symbols and strings do not differ.
```

> What is the correct response choice for this question (a,b,c)?

User inputs
```
a
```

> New question added!!

> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

####### Acceptance Criteria

* User can go to a Administrator Panel

* User can choose to add a question

* Program walks through adding the elements of a question

* Program assigns a unique ID to the question


##### Edit Question Unit

####### Usage Example

In order to correct an improper question category

I want to change the category in the database

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities


User inputs
```
$ 4
```
> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu


User inputs
```
2
```
> QuestionId of question to edit


User inputs
```
5
```
> Part of question to edit (Category, Q, A, B, C, Correct)


User inputs
```
Category
```

> What is the new category for this question?


User inputs
```
ruby
```

> Question edited!

> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

####### Acceptance Criteria

* From the Administrator Panel, user can select to edit an existing question

* Program prompts user for QuestionId and part of the question to edit

* Program edits the question and returns to the Administrator Panel

##### Delete Question Unit

####### Usage Example

In order to remove duplicate questions

I want to delete a question from the database

User inputs
```
$ Flashcards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 4
```

> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

User inputs
```
3
```

> QuestionId of question to delete

User inputs
```
5
```

> Question deleted!

> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

####### Acceptance Criteria

* From the Administrator Panel, user can choose to delete an existing question

* Program prompts user for the QuestionId of the question to be deleted

* User enters the corresponding QuestionId and the program deletes the question

* User is returned to the Administrator Panel

##### Review all questions

####### Usage Example

In order to find QuestionId of the question it edit or delete

I want to review of a list of all questions and their answers

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 4
```
> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

User inputs
```
4
```
> list of questions shows with Q, Answers, Correct, Category

> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

####### Acceptance Criteria

* From the Administrator Panel, user can choose to see a list of all questions

* Program outputs a list of each question containing: question body, each choice, correct answer, category

* User is returned to the Administrator Panel

##### Return to main menu

####### Usage Example

In order to play the game instead of admin activities

I want to return to the main menu

User inputs
```
$ ./flash_cards
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

User inputs
```
$ 4
```
> Administrator Panel

> Please choose from the following:

> 1. Add a new question

> 2. Edit an existing question

> 3. Delete a question

> 4. See a list of all current questions

> 5. Return to main menu

User inputs
```
5
```

> Welcome to Flashcards!

> Please choose from the following:

> 1. Play a new game

> 2. View score dashboard

> 3. Review missed questions

> 4. Administrator activities

####### Acceptance Criteria

* From the Administrator Panel, user returns to the main menu

##### Scenario 273

####### Usage Example

In order to

I want to

####### Acceptance Criteria
