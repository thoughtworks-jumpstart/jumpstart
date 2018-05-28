### Folder structure
Rules of thumb:
* For simple applications:
    * keep all components under `./src/components`
    * Create a directory for each component. For example, if you're creating `MyComponent.js`, it should be stored as such:
    
```
src
  components/
    my-component/              // kebab-case for directory
      MyComponent.js           // TitleCase for js/css files
      MyComponent.test.js
      MyComponent.css
```
* For more complicated and bigger applications, you can structure your directories according to features or routes. Components which are shared across features can be pulled up to a common `utils/` folder

Example:
```
src/
  common/
    Avatar.js
    Avatar.css
    APIUtils.js
    APIUtils.test.js
  feed/
    index.js
    Feed.js
    Feed.css
    FeedStory.js
    FeedStory.test.js
    FeedAPI.js
  profile/
    index.js
    Profile.js
    ProfileHeader.js
    ProfileHeader.css
    ProfileAPI.js

```

Further reading: https://reactjs.org/docs/faq-structure.html