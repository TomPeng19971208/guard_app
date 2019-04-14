import React, { Component } from 'react';
import {
  OpsContainer,
  UserWrapper,
  IncidentsWrapper,
  ActionsWrapper,
} from './styled-components/operationStyles';
import UserSession from './userSession';
import ReportButton from './reportButton';
import EmergencyButton from './emergencyButton';
import ListRecords from './listRecords';

class Operation extends Component {
  render() {
    return (
      <OpsContainer>
        <UserWrapper>
          <UserSession />
        </UserWrapper>
        <IncidentsWrapper>
          <ListRecords />
        </IncidentsWrapper>
        <ActionsWrapper>
          <ReportButton />
          <EmergencyButton />
        </ActionsWrapper>
      </OpsContainer>
    );
  }
}

export default Operation;