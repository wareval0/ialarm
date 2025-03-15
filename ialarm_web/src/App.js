import React from 'react';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import PageCalendar from './components/PageCalendar';
import Inicio from './components/Inicio';
import NavBar from './components/NavBar';

const App = () => {
  return (
    <div >
      <NavBar />
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Inicio />} />
          <Route path="/calendario" element={<PageCalendar />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
};

export default App;