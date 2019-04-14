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
    axios.get('http://localhost:4000/api/types')
      .then((response) => {
        this.setState({
          types: response.data.data,
        });
      })
      .catch(() => {
        console.log("error");
      })
  }

  reportCrime() {
    axios.post(apiUrl + "")
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
    const { coords } = this.props;
    const x = coords.longitude;
    const y = coords.latitude
    const payLoad = {
      "record": {
        "x": x,
        "y": y,
        "description": $("#description").val(),
        "types": this.state.options,
        "user_id": localStorage.getItem("userData"),
      }
    }
    console.log(payLoad);
    axios.post(apiUrl + "records", payLoad)
      .then(() => {
        alert("Thank You");
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
        <ReportCrimeWrapper>
          <input id="description" name="description" type="description"
            placeholder="Add Address" />
        </ReportCrimeWrapper>
        <form>
          {this.renderCheckboxes()}
        </form>
        <div>
          <Button onClick={this.reportCrime.bind(this)}>
            Submit
          </Button>
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