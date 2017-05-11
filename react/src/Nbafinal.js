import React from 'react'
//import Review from './Review'
//import '../styles/Bar.css'

const Nbafinal = props => {
  let city = ""
  let mvp_message = ""
  if (props.champion == "Celtics")
    city = "Boston"
  else {
    city = "Los Angeles"
  }

  if (props.year >= 1969) {
    mvp_message = "was the MVP of the series."
  }
  
    return(
    <div>
      <p> The {city} {props.champion} won the {props.year} NBA
    Championship in {props.numgames} games.</p>
      <p> {props.mvp} {mvp_message} </p>
    </div>
  )
}

export default Nbafinal;
