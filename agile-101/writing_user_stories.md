# Writing User Stories

## User Stories Vs Requirements

### What is a User Story?

A **short** descriptions of functionality told from the **user’s perspective**. The focus is **on why** and **how the user interacts** with the software. A user story is essentially a high-level definition of what the software should be capable of doing.

A good user story is written in

- simple language
- speaks to the reason and anticipated benefits of a specific area of the software.

**As a** customer\
**I want to** be able to view the items in my cart\
**So that** I know for sure what I’m purchasing.

### What is a Requirement?

Traditional requirements describe
**how the software should act**. The intent of the system is the main focus. Requirements documents go into **great detail** on how an area of **software should work**. They typically serve the purpose of guiding how the software team will build something.

Requirements documents go into a lot of detail and take a good amount of time to write. They set the level of quality for functionality, performance, and user experience.

**Some examples of requirements:**

- Display the name of each item in the shopping cart.
- Display the quantity of each item in the shopping cart.
- Allow the user to remove any items in the shopping cart.

## Focus on the Value

So what is the real purpose listing requirements as a User story?

By forcing the user/customer to supply a solid, tangible business benefit as a reason for the existence of this feature, you can...

- Avoid unnecessary work
- Better prioritize the features
- Possibly provide better alternatives

## Story Depth

**Epics** are system functionality viewed from a high level

**User stories** are epics divided out into smaller chunks for development

**Tasks** are defined in a story stating what the scope of the story

![Different levels of stories](../.gitbook/assets/writing_user_stories/story_levels.png)

While the stories that comprise an epic may be completed independently, their business value isn't realized until the entire epic is complete. This means that it rarely makes sense to deliver an epic until all of the underlying stories are complete.

Example of an Epic:

**As a** user\
**I want to** backup my entire hard drive\
**So that** I don’t lose my data when unexpected things happen

Example of a User Story:

**As a** power user\
**I want to** specify files or folders to backup based on file size, date created and date modified.\
**So that** I can easily manage and decide what files to back up

## Story writing best practices

- Follow the format
  - **"As a"** should always refer to a person
  - Do not make the **"so that"** redundant
- Keep it short and concise
- Use the I.N.V.E.S.T. principle
- Story should not specify implementation detail

## Vertical Slicing

![Vertical slicing](../.gitbook/assets/writing_user_stories/vertical_slice.png)

A vertical slice makes an independent user story that has pieces of different layers to provide a fully functional feature.

eg:

- Pay order manually
- Pay order with PayPal
- Pay order with creditcard

Slice your stories like you slice a cake (a thin slice that contains a little of each layer)

### Slicing Strategy 1: Split by workflow steps

As customer I want to
**purchase the goods in my shopping basket** so that I can receive my products at home

Given a fairly standard order procedure, we could identify the following steps:

As customer I want to ...

- **log in with my account**, so I don't have to re-enter my personal information every time;
- **review and confirm my order**, so I can correct mistakes before I pay;
- **pay for my order with a wire transfer**, so that I can confirm my order;
- **pay for my order with credit card**, so that I can confirm my order;
- **receive a confirmation email with my order**, so I have proof of my purchase;

### Slicing Strategy 2: Split by business rules

As shop owner I don’t want
**customer to purchase goods in some situation** so that I am not selling at a loss

Given a fairly standard order procedure, we could identify the following 'business rules' that underlie this process:

As shop owner I want to...

- **decline orders below 10 dollars**, because I don't make any profit on them;
- **decline customers from outside the US**, because the shipping expenses make these orders unprofitable;
- **reserve ordered products from stock for 48 hours**, so other customers see a realistic stock;
- **automatically cancel orders for which I have not received payment within 48 hours**, so I can sell them again to other customers;

### Slicing Strategy 3: Split by happy/unhappy flow

As customer I want to
**log in with my account** so that I can access secured pages;

If we consider a regular login procedure, we can identify a happy flow and several potential unhappy flows:

- As user I want to

  - **log in with my account**, so that I can access secure pages (happy);
  - **able to reset my password when my login fails**, so I can try to log in again (unhappy);
  - **be given the option to register a new account if my login is not known**, so I can gain access to secure pages (unhappy);

- As site owner I want to
  - **block users that log in incorrectly three times in a row**, so I can protect the site against hackers (unhappy);

### Slicing Strategy 4: Split by input options/platforms

As shop owner want to
**view my shop’s sales history**, so I and keep track and audit them

If we consider a convenient time of usage of the shop-owner, we can identify the following steps:

As shop owner I want to…

- **view sales history on my desktop**, so I know the status of the sprint;
- **view sales history on my mobile phone**, so I know the status of the sprint;
- **view sales history on a touchscreen**, so I know the status of the sprint;
- **view sales history on a printout**, so I know the status of the sprint;

### Strategy 5: Split by operations

As shop owner I want to
**manage products in my webshop**, so I can update price and product information if it is changed

By identifying the individual operations required for this functionality, we can derive the following smaller bits of functionality:

As shop owner I want to

- **add new products**, so customers can purchase them;
- **update existing products**, so I can adjust for changes in pricing or product information;
- **delete products**, so I can remove products that I no longer stock;
- **hide products**, so they cannot be sold for the time being;

### Strategy 6: Split by roles

As news organization I want to
**publish new articles on our homepage**, so customers have a reason to return periodically

By considering the various roles that are involved, we can break the functionality down into the following bits:

- As customer I want to

  - **read a new article**, so I can be informed of important events;

- As journalist I want to

  - **write an article**, so it can be read by our customers;

- As editor I want to

  - **review the article before putting it on the site**, so that we can prevent typos;

- As admin I want to

  - **be able to remove articles from the site**, so that we can pull offending articles;

- As customer I want to
  - **review and confirm my order**, so I can correct mistakes before I pay;

## Story Maps

A **Story Map** is a way to arrange stories on the wall to show the whole product in a comprehensive way and make it much more easily explainable and discussable.

![A Story Map](../.gitbook/assets/writing_user_stories/story_map.png)

Horizontally you place the **Epics** this is known as the **Backbone**

Vertically you place the **User stories** under that Epic in order of priority with the most important on the top and the least important at the bottom, these are known as the **Ribs**

**To help in prioritising**
- you could discuss beforehand with your team and the Product Owner (PO) which cards are:
  - Must haves (most important)
  - Should haves (medium important)
  - Could haves (least important)

Circled in red is the **Walking Skeleton** it is a tiny implementation of the system that performs a small end-to-end function. It need not use the final architecture, but it should link together the main architectural components. The architecture and the functionality can then evolve in parallel as the project progresses

The aim is to prioritise the development of the project so that the walking skeleton is up as soon as possible. Now the project can be demo in a showcase for further feedback.

With this two-dimensional Story Map you got an overview of your whole product. It is a perfect base for discussions with stakeholders in terms of business needs as well as with the team in terms of dependencies. At a glance you can take in the whole product and you know immediately what comes first.
