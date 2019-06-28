# Infrastructure as Code

Source: Infrastructure as Code \(Kief Morris\)

## What Is Infrastructure as Code?

"Infrastructure as code" is the idea of creating/managing infrastructure declaratively using code. Writing it in code has many benefits, which we will describe below. Like many powerful ideas in software development, it consists of a set of principles, practices and tools.

Here are some good reading materials to help you understand this concept:

* [Infrastructure as Code, Part One](https://crate.io/a/infrastructure-as-code-part-one/)

## Why Infrastructure as Code?

Challenges with Dynamic Infrastructure

* Server Sprawl
* Configuration Drift
* Snowflake Servers
* Fragile Infrastructure
* Automation Fear
* Erosion

## Principles of Infrastructure as Code

* Systems Can Be Easily Reproduced
* Systems Are Disposable
* Systems Are Consistent
* Processes Are Repeatable
* Design Is Always Changing

## "Infrastructure as Code" Practices

* Use Definition Files
* Self-Documented Systems and Processes
* Version Control All the Things \(Avoid using GUIs more than once\)
  * What to version control? Database schemas, web server configuration files, application server configuration information, message queue configuration, and every other aspect of the system that needs to be changed for your system to work should be under version control.
* Continuously Test Systems and Processes
* Small Changes Rather Than Batches
* Keep Services Available Continuously

## Dynamic Infrastructure Platform

* What is it?
* What are its requirements?
  * Programmable
  * On-Demand
  * Self-Service
* Infrastructure Resources Provided by the Platform
  * Compute Resources
  * Storage Resources
  * Network Resources

## Infrastructure Definition Tools

* Requirements:
  * Scriptable Interface
  * Unattended Mode for Command-Line Tools
  * Support for Unattended Execution
  * Externalized Configuration
* Working with Infrastructure Definition Tools
  * Provisioning Infrastructure with Procedural Scripts
  * Defining Infrastructure Declaratively
  * Using Infrastructure Definition Tools

## Resources

* [Infrastructure as Code](https://www.amazon.com/Infrastructure-Code-Managing-Servers-Cloud/dp/1491924357)

