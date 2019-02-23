# Basic Commandline

The **command line** is a program that enables us to send commands to the computer and receive output. It is also referred to as the **terminal** or **shell**.

## Code along

* Follow the instructions in this link: [https://github.com/thoughtworks-jumpstart/learn-shell](https://github.com/thoughtworks-jumpstart/learn-shell)

## Learning checklist

* Understand why it's important to know how to use Unix commands
* Identify commands \(and their options\) used for navigating directories
  * `pwd`
  * `ls`
  * `cd`
    * current directory: `.`
    * navigating back one directory: `..`
    * home directory: `~`
    * relative path: `./`
    * absolute path: `/`
* Working with directories
  * Creating a directory: `mkdir <my-directory>`
  * Use `mkdir` to create a directory for all projects used in this course
* Working with files
  * Create a file: `touch ./my-file.txt`
  * Read a file: `cat <file>`, `less <file>`, `more <file>`
* Use commands to manipulate files/directories \(moving, copying, reading, editing, removing\)
  * `mv <source> <target>`
  * `cp [-r] <source> <target>`
  * `rm [-r]` \(there is no undo, so be careful!\)
  * `vi`
    * Edit in vim: `Esc` + `i` \(Insert mode\) --&gt; make your edits
    * Save and exit: `Esc` + `:wq` \(Write and Quit\)
    * Exit without saving: `Esc` + `:q!` \(Quit!\)
* `history`
* `|` - pipe command
* `grep`
  * Useful for search for a string within a large file: `history | grep 'mkdir'`
* `$PATH`
  * The shell path for a user in macOS or OSX is a set of locations in the filing system whereby the user has permissions to use certain applications, commands and programs without the need to specify the full path to that command or program in the Terminal
  * Your shell path is a bunch of absolute paths of the filing system separated by colons :
  * Check your `$PATH`by using command `echo $PATH`
    * Example of a path `/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin`
    * This is stating that you can run Unix style applications located in 5 default locations of path
      * /usr/bin
      * /bin
      * /usr/sbin
      * /sbin
      * /usr/local/bin
  * example of how to add a directory path to $PATH: `export PATH=$PATH:/usr/local/share/google/google-cloud-sdk/bin/`
  * for persistence, add it to `.bash_profile` or `.zshrc` file, so that the export command is run everytime a shell session is started
* `~/.bash_profile` or `~/.zshrc`
  * If you need some shell commands to run automatically when you launch a new shell, put them into these files. For example, you can setup your `PATH` environment variable automatically in this way.
* Terminal shortcuts
  * Ctrl + C - terminate process
  * Ctrl + A - go to beginning of line
  * Ctrl + E - go to end of line
  * Ctrl + L - clear screen
  * Ctrl + R - search past commands
  * Ctrl + D - exit terminal
  * up / down - scroll through previous commands
* Distinguish between absolute and relative paths
* RTFM \(Read the friendly manual\). Note: man pages are only available on Mac and Linux. For windows, you can use TLDR (mentioned below)
  * `man <command>`, or
  * `<command> --help`/`<command> -h`
  * to exit the `man` page, hit `q`
* TLDR
  * If you don't like to read the long man pages, install a tool called [tldr](https://tldr.sh/)
* `which`
  * Search installation directory of a command/tool
* Apply commands towards everyday problems and workflows

## Resources

* [The Unix File System Commands](https://flaviocopes.com/unix-filesystem/)
* [explainshell.com](https://explainshell.com/)
* [Learn enough command line to be dangerous](https://www.learnenough.com/command-line-tutorial)
* [Introduction to Unix Shell](http://swcarpentry.github.io/shell-novice/)
* [The Linux Command Line](http://linuxcommand.org/tlcl.php)
* [Bash cheat sheet](https://github.com/0nn0/terminal-mac-cheatsheet)
* [The art of command line](https://github.com/jlevy/the-art-of-command-line)
* [Terminals are sexy](https://terminalsare.sexy/)

## In-class lab

* [https://www.learnenough.com/command-line-tutorial\#sec-exercises\_manipulating](https://www.learnenough.com/command-line-tutorial#sec-exercises_manipulating)
* [https://www.learnenough.com/command-line-tutorial\#sec-exercises\_summary\_manipulating](https://www.learnenough.com/command-line-tutorial#sec-exercises_summary_manipulating)

## (Optional) Assignment

Solve the [command line murder mystery](https://github.com/veltman/clmystery)

