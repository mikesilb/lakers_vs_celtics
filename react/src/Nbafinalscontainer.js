import React, { Component } from 'react';
import NbafinalTile from './NbafinalTile';

class Nbafinalscontainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      years: [],
      nbafinals: [],
      year: '',
      numgames: '',
      champion: '',
      mvp: '',
      messages: []
    }
    this.getRandomNbafinal = this.getRandomNbafinal.bind(this)
    this.handleYearChange = this.handleYearChange.bind(this)
    this.handleNumgamesChange = this.handleNumgamesChange.bind(this)
    this.handleChampionChange = this.handleChampionChange.bind(this)
    this.handleMVPChange = this.handleMVPChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  componentDidMount(){
    fetch('/api/v1/nbafinals')
    .then(response => {
      let parsed = response.json()
      return parsed
      console.log(parsed)
    }).then(years => {
      this.setState({ years: years })
    })
  }

  getRandomNbafinal(){
    let NbafinalIds = this.state.years
    console.log(NbafinalIds)
      let orderedNbafinalId = NbafinalIds[0]
      fetch(`/api/v1/nbafinals/${orderedNbafinalId}`)
      .then(response => {
        let parsed = response.json()
        console.log(parsed)
        return parsed
      }).then(nbafinal => {
        let newState = [...this.state.nbafinals, nbafinal]
        this.setState({nbafinals: newState})
      })
    // }
  }
  handleYearChange(event){
    let newYear = event.target.value
    this.setState({ year: newYear })
  }

  handleNumgamesChange(event){
    let newNumgames = event.target.value
    this.setState({ numgames: newNumgames })
  }

  handleChampionChange(event){
    let newChampion = event.target.value
    this.setState({ champion: newChampion })
  }

  handleMVPChange(event){
    let newMVP = event.target.value
    this.setState({ mvp: newMVP })
  }

  handleSubmit(event){
    event.preventDefault()
    let requestBody = { year: this.state.year, numgames: this.state.numgames, champion: this.state.champion, mvp: this.state.mvp }
    fetch('/api/v1/nbafinals', { method: 'POST', body: JSON.stringify(requestBody) })
    .then(response => {
      let parsed = response.json()
      return parsed
    }).then(message => {
      this.setState({ messages: message.message })
    })
  }

  render(){

    let nbafinals = this.state.years.map(year => {
      return(
        <NbafinalTile
          key={year}
          year={year}
        />
      )
    })

    let errors = this.state.messages.map(error => {
      return(
        <p>{error}</p>
      )
    })
    return(
      <div>
        {nbafinals}
        {this.props.children}
        {errors}
      </div>
    )
  }
}

export default Nbafinalscontainer;
