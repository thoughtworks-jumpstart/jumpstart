# Unix command line

The **command line** is a program that enables us to send commands to the computer and receive output. It is also referred to as the **terminal** or **shell**.

### Code along
- Follow the instructions in this link: https://github.com/thoughtworks-jumpstart/learn-shell

### Learning checklist
- Understand why it's important to know how to use Unix commands
- Identify commands (and their options) used for navigating directories
	- `pwd`
	- `ls`
	- `cd`
		- current directory: `.`
		- navigating back one directory: `..`
		- home directory: `~`
		- relative path: `./`
		- absolute path: `/`
- Working with directories
	- Creating a directory: `mkdir <my-directory>`
	- Use `mkdir` to create a directory for all projects used in this course
- Working with files
	- Create a file: `touch ./my-file.txt`
	- Read a file: `cat <file>`, `less <file>`, `more <file>`
- Use commands to manipulate files/directories (moving, copying, reading, editing, removing)
	- `mv <source> <target>`
	- `cp [-r] <source> <target>`
	- `rm [-r]` (there is no undo, so be careful!)
	- `vi`
		- Edit in vim: `Esc` + `i` (Insert mode) --> make your edits
		- Save and exit: `Esc` + `:wq` (Write and Quit)
		- Exit without saving: `Esc` + `:q!` (Quit!)
- `history`
- `|` - pipe command
- `grep`
	- Useful for search for a string within a large file: `history | grep 'mkdir'`
- `$PATH`
	- example of how to add a directory path to $PATH: `export PATH=$PATH:/usr/local/share/google/google-cloud-sdk/bin/`
	- for persistence, add it to `.bash_profile`, so that the export command is run everytime a shell session is started
- `~/.bashrc` or `~/.zshrc`
- Terminal shortcuts
	- Ctrl + C - terminate process
	- Ctrl + A - go to beginning of line
	- Ctrl + E - go to end of line
	- Ctrl + L - clear screen
	- Ctrl + R - search past commands
	- Ctrl + D - exit terminal
	- up / down - scroll through previous commands
- Distinguish between absolute and relative paths
- RTFM (Read the friendly manual)
	- `man <command>`, or 
	- `<command> --help`/`<command> -h`
	- to exit the `man` page, hit `q`
- `which`

- Apply commands towards everyday problems and workflows

### Resources
- [explainshell.com](https://explainshell.com/)
- [Learn enough command line to be dangerous](https://www.learnenough.com/command-line-tutorial)
- [Bash cheat sheet](https://github.com/0nn0/terminal-mac-cheatsheet)

### In-class lab
- https://www.learnenough.com/command-line-tutorial#sec-exercises_manipulating
- https://www.learnenough.com/command-line-tutorial#sec-exercises_summary_manipulating

### Assignment
Solve the [command line murder mystery](https://github.com/veltman/clmystery)
