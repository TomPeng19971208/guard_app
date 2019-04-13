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
        </ActionsWrapper>
      </OpsContainer>
    );
  }
}

export default Operation;