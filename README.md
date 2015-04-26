##Authors
Our team, Dual-Core Processors, consists of Michael Forsyth, Nicholas Forsyth, and Emily Seto.


##Overview
In our earlier discussions, we began thinking about how there needs to be a simpler way for individuals with non-technical backgrounds to utilize the capabilities of plotting mathematical functions. Our software will provide this solution.


##Screenshots
![screenshot new gui](gui1.png)
>This is how the **gui frame** first looks when the software starts up.

![screenshot filled gui](gui.png)
>This is how the same window looks after inputting lower and upper bounds for the x-, y-coordinates on a Cartesian plane. **Note that this particular part is still in development.** For now, all function inputs must be written in the form of a **lambda**, as shown above.

![screenshot new plot](plot.png)
>This is the new plot created with the given user input.


##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
* **Data abstraction** is used to provide access to the elements of the RSS feed.
* The objects in the OpenGL world are represented with **recursive data structures.**
* **Symbolic language processing techniques** are used in the parser.


##External Technology and Libraries
For this project, we used the following libraries:
* **racket/gui/base** (http://docs.racket-lang.org/gui/)
* **plot** (http://docs.racket-lang.org/plot/)

Racket's **gui** library provides the classes and procedures that allowed us to create a graphical user interface. Our team used **gui** to create a new frame (a window), a horizontal panel within that frame, and used a few different widgets to attain user input (such as the button and text-field widgets). 


The **plot** library allows us to produce any plot (or graph) we desire. From the user input we ascertained from **gui**, our team was able to plot that information to create graphs desired by the user.


##Favorite Lines of Code
####Michael Forsyth (@mike01720)
Each team member should identify a favorite line of code, expression, or procedure written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```


####Nicholas Forsyth (@nick01720)
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```scheme
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
```


####Emily Seto (@svnaptic)
Write something here.


#How to Download and Run
There are links at the top of this webpage for downloading this program.
* Download .zip (https://github.com/oplS15projects/GrEP/zipball/master)
* Download .tar.gz (https://github.com/oplS15projects/GrEP/tarball/master)

Depending on which version you download, unzip or untar your download. There should be *gui.rkt* and *plot.rkt*. At this point in time, all of our usable code is in **plot.rkt**. Run that file in Dr. Racket, and a *gui window* should pop-up. Enter any mathematical function in pre-fix notation, all of it wrapped up in a nice little lambda, and fill out the consequent text-fields to your preference. Hit **enter**, and a new plot should appear!


Currently, our current release is Milestone 2 (https://github.com/oplS15projects/GrEP/releases/tag/Milestone2).

