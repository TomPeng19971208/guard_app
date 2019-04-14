import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class UserSession extends Component {
  logOut() {
    localStorage.removeItem("userData");
    localStorage.removeItem("userToken");
  }

  render() {
    return (
      <Link to="/">
        <button onClick={this.logOut}>
          Log Out
        </button>
      </Link>
    );
  }
}

export default UserSession;