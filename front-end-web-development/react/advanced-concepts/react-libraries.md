# React libraries

One of the great things about using React is the rich ecosystem of open-source libraries and components. For almost anything you can think of \(mobile responsive components, data visualisation, geo visualisation, state management, loading spinners, rich text editing, etc\), there is probably already an existing react component.

You can \(and should\) check out other awesome react components: [https://github.com/brillout/awesome-react-components](https://github.com/brillout/awesome-react-components)

### General process for finding and using component libraries

#### Steps

- Figure out what you're trying to do (e.g. display charts based on some data, or display a loading spinner)
- Search for a react library that might do the job ([this](https://github.com/brillout/awesome-react-components) is a great place to start)
- For each promising library, explore its documentation, and try to answer the following questions: 
  - is the library compatible with React?
  - how do I install the library (e.g. `npm install react-loader`)
  - is there a quick start guide with some examples?
  - is there a detailed API reference/documentation?
- Check out the library's demo websites (if there's one), and see if it meets your needs
- Try out the code snippets in the Quick Start/Getting Started/Examples section in a sandbox (e.g. a new `create-react-app` app) and get familiar with the library
  - Follow the installation / setup steps in the documentation (usually, it's just `npm install`, but sometimes more configuration is needed - e.g. loading a custom CSS file, etc.)
  - Load a component from the library? (e.g. `var Loader = require('react-loader'); // and I can use <Loader /> in my own components`)
  - Understand how to use the library's various components (e.g. `<Loader loaded={false} className="spinner" />`)
  - In your browser, see what the components look like
- Read the detailed API reference and try out a few more components
- Decide: does this library do what I need it to do?
  - If yes, incorporate it into your app!
  - If not, look for another library


#### What to look out for in a library
- Last commit date
- Number of GitHub stars
- Simple installation (1-2 steps ideally)
- A demo webpage
- A quick start guide
- Good documentation
- Detailed API reference

## Interesting components which we can cover in class

* Visualizing data: [https://github.com/recharts/recharts](https://github.com/recharts/recharts)
* Making components mobile responsive: [https://github.com/contra/react-responsive](https://github.com/contra/react-responsive)
* Simple transitions/animations: [https://github.com/reactjs/react-transition-group](https://github.com/reactjs/react-transition-group)

