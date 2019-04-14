import React, { Component } from 'react';
import GoogleMapReact from 'google-map-react';

class Map extends Component {
	render() {
		return (
			<div style={{ height: '100vh', width: '100%' }}>
        <GoogleMapReact
          bootstrapURLKeys='AIzaSyCEhBhHp5g3YQc7MIKNcSIlHWHblamnQVQ'
          defaultCenter={{
						lat: .95,
						lng: 20.33
					}}
          defaultZoom={8}
        />
			</div>
		)
	}
}

export default Map;