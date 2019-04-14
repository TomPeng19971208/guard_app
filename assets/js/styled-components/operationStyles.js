import styled from 'styled-components';
import { Button } from "react-bootstrap";

export const OpsContainer = styled.div`
  display: flex;
  flex-direction: column;
  height: 100vh;
`

export const UserWrapper = styled.div` 
  height: 20%;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
`

export const IncidentsWrapper = styled.div`
  height: 60%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
`

export const ActionsWrapper = styled.div`
  height: 20%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
`

export const ReportButton = styled.button`
  &:hover {
    cursor: pointer;
  }
`

export const SubmitButton = styled(Button)`
  &:disabled {
    background-color: gray;
    border: none;
  }
`

export const ReportCrimeWrapper = styled.div`
  display: flex;
  flex-direction: column;
`