# Shell scripting

Some introduction to the topic

## Learning checklist

* what is a shell script
* `#!/bin/bash` and `#!/usr/bin/env bash`
* `set -e` and `set -x`
* how to make scripts executable `chmod +x my_script.sh`
* how to execute scripts
* `$(( ))` for arithmetic operations
* how to define and use variables
* how to refer to arguments
* exit codes
* be careful with destructive commands \(e.g. rm\) and overwriting files \(outside a version-controlled directory\). it **will** execute and you can delete important things!

## Resources

### Recommended reading

* [Unix Philosophy](https://www.reddit.com/r/programming/comments/77r0qu/i_just_stumbled_upon_the_basics_of_the_unix/)
* [Bash handbook](https://github.com/denysdovhan/bash-handbook)
* [Bash guide](https://github.com/Idnan/bash-guide)
* [https://explainshell.com](https://explainshell.com)

### References

* **Assignment**

Instructions: Write the shell scripts detailed below. At each step, execute the shell script to verify that the script does what it's supposed to

* Write a shell script \(`hello_world.sh`\) to:
  * Write 'hello world' to a file named `hello.txt`
  * echo the contents of `hello.txt` to standard output \(a.k.a. stdout, i.e. the terminal screen\)
  * Copy `hello.txt` to `hello2.txt`
  * Overwrite the contents of `hello2.txt` to contain only 'goodbye'
  * Add a new line 'world' to `hello2.txt`
  * echo the contents of `hello2.txt`
  * exit with code 0
* Write a shell script \(`greet_user.sh`\) to:
  * take in a string as the first argument \(e.g. `./greet_user.sh obama`\)
  * echo "hello, nice to meet you obama!!!" to standard output
  * add a `if` statement do 2 things if no name/string is provided when `./greet_user.sh` is executed:
    * echo to the screen "ERROR: No input is provided. Exiting now..."
    * `exit` with status code 1
  * Extend the `if` statement to include a second check to ensure that the length of the string greater than 1
    * hint: use `[[ ]]`, `||` and `$(echo -n $1 | wc -m)`
* Write a shell script \(`add_numbers.sh`\) to:
  * take in 2 arguments \(e.g. `add_numbers.sh 1 2`\)
  * add the 2 numbers and print the results to screen as such: `The sum is: <output>`
  * 
* Write a shell script \(`run_everything.sh`\) to run all the shell scripts above:
  * Version 1. Run the following:
    * `hello_world.sh`
    * `greet_user.sh bob`
    * `add_numbers.sh 1 2`
  * Version 2 \(add the `set -e` option and run the following:
    * `hello_world.sh`
    * `greet_user.sh`
    * `add_numbers.sh 1 2`
    * \(this should exit with error at `greet_user.sh`, and you should not see the results of `add_numbers.sh`\)
* Commit and push your changes to github!

## More fun assignments

* [http://overthewire.org/wargames/bandit/](http://overthewire.org/wargames/bandit/)

