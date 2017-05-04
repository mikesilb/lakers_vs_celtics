import React, { Component } from 'react';
import NewNbafinalForm from './NewNbafinalForm';
import NbafinalTile from './NbafinalTile';

class App extends Component {
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
    }).then(ids => {
      this.setState({ ids: ids })
    })
  }

  getRandomNbafinal(){
    let NbafinalIds = this.state.ids
    let randomNbafinalId = NbafinalIds[Math.floor(Math.random()*NbafinalIds.length)]
    fetch(`/api/v1/nbafinals/${randomNbafinalId}`)
    .then(response => {
      let parsed = response.json()
      console.log(parsed)
      return parsed
    }).then(nbafinal => {
      let newState = [...this.state.nbafinals, nbafinal]
      this.setState({nbafinals: newState})
    })
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
    let nbafinals = this.state.nbafinals.map(nbafinal => {
      return(
        <NbafinalTile
          year={nbafinal.year}
          numgames={nbafinal.numgames}
          champion={nbafinal.champion}
          mvp = {nbafinal.mvp}
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
        <h1>Add a new NBA Finals:</h1>
        {nbafinals}
        {errors}
        <NewNbafinalForm
          handleYearChange={this.handleYearChange}
          handleNumgamesChange={this.handleNumgamesChange}
          handleChampionChange={this.handleChampionChange}
          handleMVPChange={this.handleMVPChange}
          handleSubmit={this.handleSubmit}
          year={this.state.year}
          numgames={this.state.numgames}
          champion={this.state.champion}
          mvp={this.state.mvp}
        />
      </div>
    )
  }
}

export default App;
