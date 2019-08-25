---
layout: programming
title: Softare Design
lang: en
---
# Software Design

Some notes about designing software.

## Software Design Principles 

### SOLID Principles

**SOLID** is a mnemonic acronym for a set of design principles created for software development in object-oriented languages.

The principles in SOLID are intended to foster simpler, more robust and updatable code from software developers. Each letter in SOLID corresponds to a principle for development:

* Single responsibility
* Open/closed
* Liskov substitution
* Interface segregation
* Dependency inversion

The Single responsibility principle, created by Robert C. Martin, states that a class should have one, and only one, reason to change. This principle ensures that any class should have only one function, to help ease updating and limit the possible complications by future changes. The principle can be applied to software components or microservices tools.

The Open/closed principle ensures that software entities be open to extension but closed for modification. Bertrand Meyer is mainly credited with the creation of this principle, which focuses on making the abilities of a class easy to enhance by extension but prevents possible complications that could be brought about by modifying the entity and affecting dependencies of other functions that rely on it.

The Liskov principle stipulates that objects of the same type be replaceable with others from this same category without altering function of the program. Created by Barabara Liskov, this principle ensures that more effective means of performing a task can be switched to without unduly affecting the program or requiring substantial code updates.

The Interface segregation principle stipulates that the application’s interfaces should always be kept smaller and separate from one another. This principle ensures that clients need only familiarize themselves with functionality of methods or interfaces that are used, so they can respectively be updated without one complicating the other. This separation made by layers of abstraction provides space to document functionality while avoiding the coupling of dependencies in code.

The Dependency inversion principle specifies a form of decoupling dependencies in code. In dependency inversion, the dependencies in high-level code that set policies are inverted to the low-level dependency modules. This separates the high-level code from the details of low-level modules.

### KISS Principle 
The **KISS** Principle (Keep It Simple, Stupid) is self-descriptive and recognizes two things:

1. People (including product and service users) generally want things that are simple, meaning easy to learn and use.

2. A company that makes products or furnishes services may find simplicity an advantage for the company as well, since it tends to shorten time and reduce cost. (Where the company is trying to use the principle on behalf of users, however, design time may take longer and cost more, but the net effect will be beneficial since easy-to-learn-and-use products and services tend to be cheaper to produce and service in the long run.)

The New Hacker's Dictionary, edited by Eric Raymond, says that the KISS Principle is sometimes cited on a development project to fend off feature creep.

The somewhat related idea of Ockham's razor is about always looking for the simplest explanation.

### DRY principle

The DRY (don't repeat yourself) principle is a best practice in software development that recommends software engineers to do something once, and only once. The concept, which is often credited to Andrew Hunt  and David Thomas, authors of "The Pragmatic Programmer," is the tongue-in-cheek opposite of the WET principle, which stands for "write everything twice."

According to the DRY principle, every discrete chunk of knowledge should have one, unambiguous, authoritative representation within a system. The goal of the DRY principle is to lower technical debt by eliminating redundancies in process and logic whenever possible.

#### Redundancies in process

To prevent redundancies in processes (actions required to achieve a result), followers of the DRY principle seek to ensure that there is only one way to complete a particular process. Automating the steps wherever possible also reduces redundancy, as well as the number of actions required to complete a task.

#### Redundancies in logic

To prevent redundancies in logic (code), followers of the DRY principle use abstraction to minimize repetition. Abstraction is the process of removing characteristics until only the most essential characteristics remain.

An important goal of the DRY principle is to improve the maintainability of code during all phases of its lifecycle. When the DRY principle is followed, for example, a software developer should be able to change code in one place, and have the change automatically applied to every instance of the code in question.  

## External References and Articles

* [Software Testing Overview](https://www.tutorialspoint.com/software_engineering/software_testing_overview.htm)
