import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import IPolice from './ipolice';

export default function init(root) {
  ReactDOM.render(<Root />, root);
}

class Root extends Component {
  render() {
    return (
      <Router>
        <Route exact path="/" component={IPolice} />
      </Router>
    );
  }
}