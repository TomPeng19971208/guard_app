import styled from 'styled-components';

export const OpsContainer = styled.div`
  display: flex;
  flex-direction: column;
  height: 100vh;
`

export const LoginWrapper = styled.div` 
  height: 10%;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
`

export const IncidentsWrapper = styled.div`
  height: 70%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
`

export const ActionsWrapper = styled.div`
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