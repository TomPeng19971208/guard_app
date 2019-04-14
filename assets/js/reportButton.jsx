import React, { Component } from 'react';
import Popup from 'reactjs-popup';
import { ReportCrimeWrapper } from './styled-components/operationStyles';
import axios from 'axios';
import { Button } from 'react-bootstrap';
import { apiUrl } from './constant';
import { geolocated } from 'react-geolocated';

class ReportButton extends Component {
  constructor(props) {
    super(props);
    this.state = ({
      types: [],
      options: [],
    });
  }

  componentDidMount() {
    axios.get('https://police.zy-peng.com/api/types')
      .then((response) => {
        this.setState({
          types: response.data.data,
        });
      })
      .catch(() => {
        console.log("error");
      })
  }

  onChange(e) {
    let index = 0;
    const { options } = this.state;
    if (e.target.checked) {
      options.push(+e.target.value);
    }
    else {
      index = options.indexOf(+e.target.value);
      options.splice(index, 1);
    }

    this.setState({ options: options });
  }

  renderCheckboxes() {
    return this.state.types.map((type) => {
      return (
        <div>
          <label>{type.name}</label>
          <input type="checkbox" value={type.id} onChange={this.onChange.bind(this)} />
        </div>
      );
    })
  }

  reportCrime() {
    let options = this.state.options;
    navigator.geolocation.getCurrentPosition(function(position) {
      let y= position.coords.latitude;
      let x = position.coords.longitude;
      const payLoad = {
        "record": {
          "x": x,
          "y": y,
          "description": $("#description").val(),
          "types": options,
          "user_id": localStorage.getItem("userData"),
        }
      }
      axios.post(apiUrl + "records", payLoad)
        .then((resp) => {
          console.log(resp.data.data.id)
          alert("Thank You");
          let temp = {"record_id": resp.data.id}
          axios.post(apiUrl + "inform_residents", {"record_id": resp.data.data.id})
            .then((resp) => {
              //window.location.reload();
            });
        });
    });
  }


  render() {
    return (
      <Popup contentStyle={{ width: '40%' }}
        trigger={
          <button className="btn btn-info">
            Report A Crime
          </button>
        }
        modal closeOnDcumentClick>
        <div>
          <ReportCrimeWrapper>
            <input id="description" name="description" type="description"
              placeholder="Add Description" />
          </ReportCrimeWrapper>
          <form>
            {this.renderCheckboxes()}
          </form>
          <div>
            <Button onClick={this.reportCrime.bind(this)}>
              Submit
          </Button>
          </div>
        </div>
      </Popup>
    );
  }
}

export default geolocated({
  positionOptions: {
    enableHighAccuracy: true,
  },
  userDecisionTimeout: 5000,
})(ReportButton);
