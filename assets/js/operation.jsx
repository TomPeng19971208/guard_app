import React, { Component } from 'react';
import {
  OpsContainer,
  UserWrapper,
  IncidentsWrapper,
  ActionsWrapper,
} from './styled-components/operationStyles';
import UserSession from './userSession';
import axios from 'axios';
import { apiUrl } from './constant';

class Operation extends Component {
  reportCrime() {
    const payLoad = {

    }
    axios.post(apiUrl + records)
      .then((response))
  }

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
          <Popup contentStyle={{ width: '40%' }}
            trigger={
              <button className="btn btn-info">
                Report A Crime
              </button>
            }
            modal closeOnDcumentClick>
            <input id="zip" name="zip" type="zip"
              placeholder="Create Username" />
            <input id="address" name="address" type="address"
              placeholder="Create Password" />
            <input id="description" name="description" type="description"
              placeholder="Add Address" />
            <input id="types" name="types" type="types"
              placeholder="Add Phone Number" />
          </Popup>
          <button className="btn btn-danger">
            911
          </button>
        </ActionsWrapper>
      </OpsContainer>
    );
  }
}

export default Operation;