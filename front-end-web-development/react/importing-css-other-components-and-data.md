# Importing css, other components and data

Importing other React components and css styles:

```javascript
  import React from "react";
  import OtherComponent from "path/to/OtherComponent"  // importing other components
  import "./Welcome.css"; // importing css styles

  class Welcome extends React.Component {
      render() {
          return <h1>Hello world</h1>
      }
  }
```

Importing data \(e.g. arrays, objects\)

```javascript
// seedData.js
export const names = ['alice', 'tim', 'june', 'bob']

// SomeComponent.js
import {names} from './seedData.js';
```

