import React, { Component } from 'react';
import {
  OpsContainer,
  LoginWrapper,
  IncidentsWrapper,
  ActionsWrapper,
} from './styled-components/operationStyles';
import Login from './login';

class Operation extends Component {
  render() {
    return (
      <OpsContainer>
        <LoginWrapper>
          <Login />
        </LoginWrapper>
        <IncidentsWrapper>
          <p>
            dd
          </p>
          <p>
            dd
          </p>
          <p>
            dd
          </p>
          <p>
            dd
          </p>
          <p>
            dd
          </p>
        </IncidentsWrapper>
        <ActionsWrapper>
          <button className="btn btn-info">
            Report An Accident
          </button>
          <button className="btn btn-danger">
            911
          </button>
        </ActionsWrapper>
      </OpsContainer>
    );
  }
}

export default Operation;