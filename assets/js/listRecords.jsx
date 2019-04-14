import React, { Component } from 'react';
import axios from 'axios';

class ListRecords extends Component {
  constructor(props) {
    super(props);
    this.state = ({
      records: [],
    })
  }

  componentDidMount() {
    const today = new Date();
    axios.get("https://police.zy-peng.com/api/records")
      .then((response) => {
        const records = response.data.data.filter((record) => {
          let date = new Date(record.date);
          return date.getYear() === today.getYear()
            && date.getMonth() === today.getMonth()
            && date.getDate() === today.getDate();
        })
        this.setState({
          records: records,
        })
      })
  }

  renderRecords() {
    return this.state.records.map((record) => {
      const date = new Date(record.date);
      return (
        <p>
          {date.getHours()}:{date.getMinutes()} {record.description}
        </p>
      )
    });
  }

  render() {
    return this.renderRecords();
  }
}

export default ListRecords;
