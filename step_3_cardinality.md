## 1. Defining relationship between Theatre and Screen. 
One Theatre -> Many screens

One screen -> One Theatre

**Cardinality -> Theatre:Screen -> 1:M**

**Store the theatre_id in screen table**


## 2. Defining relationship between screen and show.  
### A show represents:
One movie
On one screen
On one date
At one start time

If two screens play the same movie at the same time. Both are unique because they are at different physical locations.

One screen -> Many shows

One show -> One screen

**Cardinality -> Screen:show -> 1:M**

**Store the screen_id in show table**


## 3. Defining relationship between Movie and show.

One Movie → Many Shows

One Show → Exactly One Movie

**Cardinality -> Movie:show -> 1:M**

**Store the movie_id in show table**

## 4. Defining relationship between Movie and actor.

One Movie -> Multiple actors

One actor -> Multiple movies

**Cardinality -> Movie:actor -> M:M**

**Create a seperate relationship table**

## 5. Defining relationship between Movie and language.

One Movie → Multiple Languages

One Language → Multiple Movies

**Cardinality -> Movie:Language -> M:M**

**Create a seperate relationship table**

## 6. Defining relationship between Language and Show.

One Language → Many Shows

One Show → Exactly One Language

**Cardinality -> Language:Show -> 1:M**

**Store the language_id in shows table**









