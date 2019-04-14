import React, { Component } from 'react';
import axios from 'axios';
import { geolocated } from 'react-geolocated';

class EmergencyButton extends Component {
  sendMessage() {
    const { coords } = this.props;
    let recordId;
    const payLoad = {
      "record": {
        "x": coords.longitude,
        "y": coords.latitude,
        "description": "This is an emergency call",
        "types": [1, 2],
        "user_id": localStorage.getItem("userData"),
      }
    };
    axios.post("http://localhost:4000/api/records", payLoad)
      .then((response) => {
        recordId = response.data.data.id;
        console.log(recordId);
        axios.post("http://localhost:4000/api/inform_residents", { "record_id": recordId })
          .then(() => {
            alert("Help Is On The Way");
            window.location.reload();
          });
      });
  }

  render() {
    return (
      <button className="btn btn-danger" onClick={this.sendMessage.bind(this)}>
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