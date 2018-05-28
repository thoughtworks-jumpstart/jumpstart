# Setting default props

You can also set default values for props using `YourComponent.defaultProps`.

For example:

```javascript
import React, { Component } from "react";

class AppButton extends Component {
  render() {
    return <button onClick={this.props.onClick}>{this.props.message}</button>;
  }
}

AppButton.defaultProps = {
  message: "Hello",
  onClick: function() {
    alert("Hello");
  }
};

export default AppButton;

```