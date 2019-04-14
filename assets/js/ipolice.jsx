import React, { Component } from 'react';
import Map from './map';
import Operation from './operation';
import Login from './login';


class IPolice extends Component {
  renderMain() {
    return (
      <React.Fragment>
        <div className="mapContainer">
          <Map />
        </div>
        <div className="operationContainer">
          <Operation />
        </div>
      </React.Fragment>
    );
  }

  render() {
    return (
      <div className="mainContainer">
        {localStorage.getItem("userData") ? this.renderMain() : <Login />}
      </div>
    );
  }
}

export default IPolice;
