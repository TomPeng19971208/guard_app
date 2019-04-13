import React, { Component } from 'react';
import ReactDOM from 'react-dom';

export default function init(root) {
  ReactDOM.render(<IPolice />, root);
}

class IPolice extends Component {
  render() {
    return (
      <div>
        This is a test map
      </div>
    );
  }
}