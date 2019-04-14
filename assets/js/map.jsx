import React, { Component } from 'react';
import GoogleMapReact from 'google-map-react';
import axios from 'axios';
import { Marker } from './styled-components/operationStyles';

class Map extends Component {
	constructor(props) {
		super(props);
		this.state = ({
			records: [],
		});
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

	renderMarkers() {
		return this.state.records.map((record) => {
			return <Marker lat={record.y} lng={record.x} text="Marker" />
		});
	}

	render() {
		// const { coords } = this.props;
		// console.log(coords.latitude);
		// console.log(coords.longitude);
		return (
			<div style={{ height: '100vh', width: '100%' }}>
				<GoogleMapReact
					bootstrapURLKeys='AIzaSyBe6sZGE3Z3NmYRNrqeKNgK6QTdWXr44sk'
					defaultCenter={{
						lat: 42.33844,
						lng: -71.0874676,
					}}
					defaultZoom={8}
				>
					{this.renderMarkers()}
				</GoogleMapReact>
			</div>
		);
	}
}

export default Map;
