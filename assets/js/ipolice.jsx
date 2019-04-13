import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import Map from './map';
import Operation from './operation';

export default function init(root) {
  ReactDOM.render(<IPolice />, root);
}

class IPolice extends Component {
  render() {
    return (
      <div className="mainContainer">
        <div className="mapContainer">
          <Map />
        </div>
        <div className="operationContainer">
          <Operation />
        </div>
      </div>
    );
  }
}