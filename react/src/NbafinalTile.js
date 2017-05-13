import React from 'react'
import { Link } from 'react-router'

const NbafinalTile = props => {
  return(
    <ul className='Nbafinal-tile'>
        <h1><a href={`/nbafinals/${props.id}`}> {props.year} </a></h1>
    </ul>
  )
}

export default NbafinalTile;
