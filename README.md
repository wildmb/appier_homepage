appier_homepage
===============

The official site of Appier.

Prerequisite
------------

1.  LESS

    The dynamic stylesheet language.

    The easiest way to install LESS is via npm, the node package manager, as so: 

    ```npm install -g less```

2.  CoffeeScript

    A little language that compiles into JavaScript.

    You can install CoffeeScript with npm:

    ```npm install -g coffee-script```


Deploy
------

Just type ```make production```, and a production directory will be generated
automatically. The css, javascript, html files are minified.
