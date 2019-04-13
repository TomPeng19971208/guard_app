import React, { Component } from 'react';
import {
  OpsContainer,
  LoginWrapper,
  IncidentsWrapper,
  ActionsWrapper,
} from './styled-components/operationStyles';

class Operation extends Component {
  render() {
    return (
      <OpsContainer>
        <LoginWrapper>
          Login
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
          <button class="btn btn-info">
            Report An Accident
          </button>
          <button class="btn btn-danger">
            911
          </button>
        </ActionsWrapper>
      </OpsContainer>
    );
  }
}

export default Operation;