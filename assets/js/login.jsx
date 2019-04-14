import React, { Component } from "react";
import { SubmitButton } from './styled-components/operationStyles';
import Popup from 'reactjs-popup';
import axios from 'axios';
import { apiUrl } from './constant';
import { Button } from "react-bootstrap";

class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      username: "",
      password: "",
    };
  }

  validateForm() {
    const { username, password } = this.state;
    return username.length > 0 && password.length > 0;
  }

  registerUser() {
    const username = $("#createUsername").val();
    const password = $("#createPassword").val();
    const address = $("#createAddress").val();
    const phone = $("#createPhone").val();
    if (username.length > 0 && password.length > 0
      && address.length > 0 && phone.length > 0) {
      const payLoad = {
        "user": {
          "username": username,
          "password": password,
          "address": address,
          "phone": phone,
        }
      };
      axios.post(apiUrl + "users", payLoad)
        .then(() => {
          this.setState({
            username: username,
            password: password,
          });
          this.signIn();
        })
    }
  }

  handleChange() {
    this.setState({
      username: $("#username").val(),
      password: $("#password").val(),
    });
  }

  handleSubmit(event) {
    event.preventDefault();
  }

  signIn() {
    const payLoad = {
      "name": this.state.username,
      "password": this.state.password,
    }
    axios.post(apiUrl + "auth", payLoad)
      .then((response) => {
        localStorage.setItem("userToken", response.data.data.token);
        localStorage.setItem("userData", response.data.data.user_id);
        window.location.reload();
      })
      .catch(() => {
        alert("Invalid Username or Password");
      })
  }

  render() {
    return (
      <div className="Login">
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input id="username" name="username" type="text"
            placeholder="Enter Username" onChange={this.handleChange.bind(this)} />

          <input id="password" name="password" type="password"
            placeholder="Enter Password" onChange={this.handleChange.bind(this)} />

          <SubmitButton
            block
            disabled={!this.validateForm()}
            type="submit"
            onClick={this.signIn.bind(this)}
          >
            Login
          </SubmitButton>

          <Popup contentStyle={{ width: '40%' }}
            trigger={
              <button className="btn btn-secondary" id="signup-b">
                Sign Up
              </button>
            }
            modal closeOnDcumentClick>
            <div>
              <input id="createUsername" name="createUsername" type="text"
                placeholder="Create Username" />
              <input id="createPassword" name="createPassword" type="password"
                placeholder="Create Password" />
              <input id="createAddress" name="createAddress" type="address"
                placeholder="Add Address" />
              <input id="createPhone" name="createPhone" type="phone"
                placeholder="Add Phone Number" />
              <div>
                <Button
                  block
                  type="submit"
                  onClick={() => { this.registerUser() }}> Create </Button>
              </div>
            </div>
          </Popup>
        </form>
      </div >
    );
  }
}

export default Login;