# React libraries

One of the great things about using React is the rich ecosystem of open-source libraries and components. For almost anything you can think of \(mobile responsive components, data visualisation, geo visualisation, state management, rich text editing, etc\), there is probably already an existing react component.

For example, to create a chart, we could simply install a library \(e.g. `npm install recharts`\) and use the components defined in the `recharts` library like so:

```jsx
import React from "react";
import {BarChart, Bar, XAxis, YAxis, Tooltip, Legend } from "recharts";

const MyBarChart = props => (
  <BarChart
    width={600}
    height={300}
    data={props.data}
    margin={{ top: 5, right: 30, left: 20, bottom: 5 }}
  >
    <XAxis dataKey="name" />
    <YAxis />
    <Tooltip />
    <Legend />
    <Bar dataKey="revenue" fill="#8884d8" />
    <Bar dataKey="cost" fill="#82ca9d" />
  </BarChart>
);
```

You can \(and should\) check out other awesome react components: [https://github.com/brillout/awesome-react-components](https://github.com/brillout/awesome-react-components)

## Interesting components which we can cover in class

* Visualizing data: [https://github.com/recharts/recharts](https://github.com/recharts/recharts)
* Making components mobile responsive: [https://github.com/contra/react-responsive](https://github.com/contra/react-responsive)
* Simple transitions/animations: [https://github.com/reactjs/react-transition-group](https://github.com/reactjs/react-transition-group)

