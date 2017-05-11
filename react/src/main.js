import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import { browserHistory, Route, Router, IndexRoute } from 'react-router';
import Nbafinalscontainer from './Nbafinalscontainer'
import Nbafinalcontainer from './Nbafinalcontainer'

// if(document.getElementById('finals-list')){
//   $(function() {
//     ReactDOM.render((
//       <Router history={browserHistory}>
//       <Route path="/" component={Nbafinalscontainer}>
//       <Route path="/nbafinals" component={Nbafinalscontainer} />
//       <Route path="/nbafinals/:id" component={Nbafinalcontainer} />
//       </Route>
//       </Router>
//     ), document.getElementById('finals-list')
//   });
// });

// $(function() {
//   if(document.getElementById('finals-list')){
//     ReactDOM.render(
//       <Router history={browserHistory}>
//       <Route path="/" component={Nbafinalscontainer}>
//       <Route path="/nbafinals" component={Nbafinalscontainer} />
//       <Route path="/nbafinals/:id" component={Nbafinalcontainer} />
//       </Route>
//       </Router>
//     ), document.getElementById('finals-list')
//   })
// });



$(function() {
  if(document.getElementById('finals-list')){
    ReactDOM.render(
      <Router history={browserHistory}>
        <Route path="/" component={Nbafinalscontainer} />
        <Route path="/nbafinals" component={Nbafinalscontainer} />
      </Router>
    , document.getElementById('finals-list')
  )
}});


$(function() {
  if(document.getElementById('nba-final-show-react')){
    ReactDOM.render(
      <Nbafinalcontainer />,
      document.getElementById('nba-final-show-react')
    )
  }
});
