import React, { Component } from 'react';
import axios from 'axios';
import { geolocated } from 'react-geolocated';

class EmergencyButton extends Component {
  sendMessage() {
    const { coords } = this.props;
    navigator.geolocation.getCurrentPosition(function(position) {
      let y= position.coords.latitude;
      let x = position.coords.longitude;
    });
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
        let recordId = response.data.data.id;
        axios.post("http://localhost:4000/api/inform_individual", {"record_id": recordId, "phone": "18054799982"})
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
