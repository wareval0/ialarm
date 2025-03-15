import React from 'react';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import PageCalendar from './components/PageCalendar';
import Inicio from './components/Inicio';
import NavBar from './components/NavBar';
import { LogIn } from './components/LogIn';
import { useLoginStore } from './hooks/useLoginStore';
import { PasswordRecovery } from './components/PasswordRecovery';

const App = () => {
  const { loggedOn } = useLoginStore();
  return (
    <div >
      { loggedOn && 
        <NavBar />
      }
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<LogIn />} />
          <Route path="/home" element={<Inicio />} />
          <Route path="/calendario" element={<PageCalendar />} />
          <Route path="/password_recovery" element={<PasswordRecovery />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
};

export default App;