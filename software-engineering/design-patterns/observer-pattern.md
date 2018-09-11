# Observer pattern

The observer pattern defines a one-to-many dependency between objects so that when the **subject \(a.k.a. publisher / observerable\) object** changes state, all its **observers \(a.k.a. subscribers\)** are notified and updated automatically.

![](../.gitbook/assets/observer_pattern_diagram.png)

## OO design principles

* Loosely coupled design
  * Subjects \(Publishers\) and Observers \(Subscribers\) know nothing about each, other than each others' interface \(i.e. the methods that they have\).
  * You can push or pull data from the Observable when using the pattern \(pull is considered more “correct”\).
* Object composition
* Classes should be closed for modification but open for extension

