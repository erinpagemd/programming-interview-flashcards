# programming-interview-flashcards



## Project Vision

Interactive command line program written in Ruby with a SQLite database. 

Users will be able to answer questions, review a score board, see a list of missed questions.

## Features

* Playing a round of the game
* View score board
* View missed questions
* Score is kept while playing game
* Ability to edit the game (edit/delete questions and answers)

## User Stories

### Only one user currently

As a junior programmer looking for a job

In order to perform well at programming interviews

I want to practice potential interview questions and review/track my results

### Scenarios

#### Start Playing

###### Usage Example

In order to start a game

I want to go to the console, run the program, and choose to start a new game

###### Acceptance Criteria

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

> Category: Ruby

> Q: How does a symbol differ from a string?

> a. Symbols are immutable and reusable, retaining the same object_id.

> b. Strings are immutable and resusable, retaining the same object_id.

> c. Symobls and strings do not differ.

#### View the Score Board

###### Usage Example

In order to set goals on performance

I want to view a summary of my scores over time

###### Acceptance Criteria

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

> 1. back

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


#### Review Missed Questions

###### Usage Example

In order to increase my knowledge base

I want to familiarize myself with questions I previously missed

###### Acceptance Criteria

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

> 1. back

user inputs 
```
1
```

#### Scenario 103

###### Usage Example

In order to 

I want to 

###### Acceptance Criteria

#### Scenario 273

###### Usage Example

In order to 

I want to 

###### Acceptance Criteria
