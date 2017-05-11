import React from 'react'
import { Link } from 'react-router'

const NbafinalTile = props => {

  return(
    <ul className='Nbafinal-tile'>
        <li><a href={`/nbafinals/${props.year}`}> {props.year} </a></li>
    </ul>
  )
}

export default NbafinalTile;
