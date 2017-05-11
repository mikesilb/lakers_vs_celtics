import React, { Component }  from 'react'
import Nbafinal from './Nbafinal'
//import '../styles/BarsContainer.css'

class Nbafinalcontainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      year: '',
      numgames: '',
      champion: '',
      mvp: ''
    }
  }

  componentDidMount() {
    let nbafinalId;

    if(document.getElementById('nba-final-show-react')) {
      nbafinalId = document.getElementById('nba-final-show-react').getAttribute('data-id');
    }
    fetch(`/api/v1/nbafinals/${nbafinalId}`)
    .then((response) => response.json())
    .then((json) => {
      console.log(json)
      this.setState({ year: json[0].year,
      numgames: json[0].numgames,
      champion: json[0].champion,
      mvp: json[0].mvp
     })
    })
  }

  render() {
    return(
      <div className="nbafinals-container">
        <Nbafinal
          key={this.state.year}
          year={this.state.year}
          numgames={this.state.numgames}
          champion={this.state.champion}
          mvp={this.state.mvp}
        />
      </div>
    )
  }
}

export default Nbafinalcontainer
