import React, { Component } from 'react';
import axios from 'axios';
import apiUrl from './constant';
import { geolocated } from 'react-geolocated';

class EmergencyButton extends Component {
  sendMessage() {
    const { coords } = this.props;
    const
    const payLoad = {
      "results": {
        "x": coords.longitutde,
        "y": coords.latitude,
        "description": "This is an emergency call",
        "types": [1, 2],
        "user_id": localStorage.getItem("userData"),
      }
    };
    // axios.post(apiUrl + "records")
  }

  render() {
    return (
      <button className="btn btn-danger">
        911
      </button>
    );
  }
}

export default geolocated({
  positionOptions: {
    enableHighAccuracy: true,
  },
  userDecisionTimeout: 5000,
})(EmergencyButton);