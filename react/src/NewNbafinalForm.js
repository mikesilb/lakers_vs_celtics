import React from 'react';

const NewNbafinalForm = props => {
  return(
    <form onSubmit={props.handleSubmit} >
      Year: <input type='text' value={props.year} onChange={props.handleYearChange}/>
      Number of Games: <input type='text' value={props.numgames} onChange={props.handleNumgamesChange}/>
      Champion: <input type='text' value={props.champion} onChange={props.handleChampionChange} />
      MVP: <input type='text' value={props.mvp} onChange={props.handleMVPChange} />
      <input type='submit' />
    </form>
  )
}

export default NewNbafinalForm;
