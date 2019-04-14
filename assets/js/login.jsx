import React, { Component } from "react";
import { SubmitButton } from './styled-components/operationStyles';
import Popup from 'reactjs-popup';
import axios from 'axios';

class Login extends Component {
  constructor(props) {
    super(props);

    this.state = {
      isLoggedin: false,
      username: "",
      password: "",
      newUsername: "",
      newPassword: "",
    };
  }

  validateForm() {
    const { username, password } = this.state;
    return username.length > 0 && password.length > 0;
  }

  handleChange() {
    this.setState({
      username: $("#username").val(),
      password: $("#password").val(),
    });
  }

  handleSubmit(event) {
    const apiUrl = "http://localhost:4000/api/";
    const payLoad = {
      "name": this.state.username,
      "password": this.state.password,
    }
    axios.post(apiUrl + 'auth', payLoad)
      .then((response) => {
        console.log(response.data);
        this.setState({
          isLoggedin: true,
        })
      })
      .catch((error) => {
        alert("Invalid Username or Password");
      })
    event.preventDefault();
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
          >
            Login
          </SubmitButton>

          <Popup contentStyle={{ width: '40%' }}
            trigger={
              <SubmitButton className="btn btn-secondary" id="signup-b">
                Sign Up
              </SubmitButton>
            }
            modal closeOnDcumentClick>
            <div >
              <input id="createUsername" name="createUsername" type="text"
                placeholder="Create Username" />
              <input id="createPassword" name="createPassword" type="password"
                placeholder="Create Password" />
              <div>
                <SubmitButton
                  block
                  type="submit"
                  onClick={() => { api.create_user() }}> Create </SubmitButton>
              </div>
            </div>
          </Popup>
        </form>
      </div >
    );
  }
}

export default Login;