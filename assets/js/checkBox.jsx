import React, { Component } from 'react';

class CheckBox extends Component {
  render() {
    return (
      <React.Fragment>
        <input key={props.id} onClick={props.handleCheckChieldElement} type="checkbox" checked={props.isChecked} value={props.value} /> {props.value}
      </React.Fragment>
    );
  }
}