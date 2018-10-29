# Git workflows

2 popular strategies for working with Git

## Trunk-based development

- In trunk-based development (TBD), developers always check into one branch, typically the master branch also called the “trunk”. 

- They check in (git push) as frequently as possible to the master — at few times a day. 

- Every developer is touching the trunk, so all features grow in the mainline which acts as a communication point.

- This workflow is meant to be used together with a Continuous Integration server that runs the test after every commit to ensure that no commit breaks the build

https://www.thoughtworks.com/insights/blog/enabling-trunk-based-development-deployment-pipelines

Benefits:
- No integration problems later as all features are integrated everyday from the very start

Disadvantages:
- Many frequent changes to master every day, if there is not enough automated tests, an integration fault could go undetected. 

## Feature Branch

![Feature branch workflow](../.gitbook/assets/git/feature_branch_workflow.png)

- Developers pull the latest master and branch out to their individual feature branch 

- They work on the feature on their branch and when it is complete, merge it to master locally.

- They run tests after the merge as well to ensure that nothing is broken before pushing their changes to master

Benefits:
- Not that many changes to master branch in a day

Disadvantages:
- If there are "long lived branchs" (eg: developer keeps a branch for many days without merging to master) there coud be a bigger merge conflict when they finally do merge to master. This causes integration delay.
- Not merging often may lead to less communication between developers and cause incompatible features to be developed by different developers