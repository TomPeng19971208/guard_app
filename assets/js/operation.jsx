import React, { Component } from 'react';
import {
  OpsContainer,
  UserWrapper,
  IncidentsWrapper,
  ActionsWrapper,
} from './styled-components/operationStyles';
import UserSession from './userSession';

class Operation extends Component {
  render() {
    return (
      <OpsContainer>
        <UserWrapper>
          <UserSession />
        </UserWrapper>
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