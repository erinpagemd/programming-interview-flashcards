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

####### Acceptance Criteria

Open the terminal and cd into the game directory.

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
$ 1
```

> Question 1 of 10

> Score: 0

> QuestionId: 5

> Category: Ruby

> Q: How does a symbol differ from a string?

> a. Symbols are immutable and reusable, retaining the same object_id.

> b. Strings are immutable and resusable, retaining the same object_id.

> c. Symbols and strings do not differ.

##### View the Score Board

####### Usage Example

In order to set goals on performance

I want to view a summary of my scores over time

####### Acceptance Criteria

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


##### Review Missed Questions

####### Usage Example

In order to increase my knowledge base

I want to familiarize myself with questions I previously missed

####### Acceptance Criteria

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

### User: Administrator

As an administrator of the game

In order to improve readability and user experience

I want to edit/delete the questions, answers, and expected responses.

#### Scenarios

##### Edit Question Unit

####### Usage Example

In order to correct an improper question category

I want to change the category in the database

####### Acceptance Criteria

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

> Enter the QuestionId to manipulate

user inputs 
```
5
```
> Is this the question you want to manipulate?

> QuestionId: 5

> Category: Ruby

> Q: How does a symbol differ from a string?

> a. Symbols are immutable and reusable, retaining the same object_id.

> b. Strings are immutable and resusable, retaining the same object_id.

> c. Symbols and strings do not differ.

> Correct Answer: A

user inputs
```
yes
```

> Would you like to edit or delete this record?

user inputs 
```
edit
```

EDITING HAPPENS NOW


##### Delete Question Unit

####### Usage Example

In order to remove duplicate questions

I want to delete a question from the database

####### Acceptance Criteria

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

> Enter the QuestionId to manipulate

user inputs 
```
5
```
> Is this the question you want to manipulate?

> QuestionId: 5

> Category: Ruby

> Q: How does a symbol differ from a string?

> a. Symbols are immutable and reusable, retaining the same object_id.

> b. Strings are immutable and resusable, retaining the same object_id.

> c. Symbols and strings do not differ.

> Correct Answer: A

user inputs
```
yes
```

> Would you like to edit or delete this question?

user inputs 
```
delete
```

> Question removed from database

>  Enter 1 to go back

##### Add a question

####### Usage Example

In order to 

I want to 

####### Acceptance Criteria


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

> Enter the QuestionId to manipulate

user inputs 
```
new
```

> Prompts for question, a. response, b. response, c. response, correct answer

> returns the QuestionId of the newly added question

##### Review all questions

####### Usage Example

In order to find QuestionId of the question it edit or delete

I want to review of a list of all questions and their answers

####### Acceptance Criteria

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

> Enter the QuestionId to manipulate

user inputs 
```
list
```

> list of questions, answers, etc goes here

##### Scenario 273

####### Usage Example

In order to 

I want to 

####### Acceptance Criteria
