import React from 'react';
import logo from '../assets/logo.svg';
import './App.css';

import LetterRow from '../components/LetterRow';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <LetterRow letters={
          [
            { content: 'a', isCorrect: false },
            { content: 'b', isCorrect: false },
            { content: 'c', isCorrect: false }
          ]
        } />
      </header>
    </div>
  );
}

export default App;
