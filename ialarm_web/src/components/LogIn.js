import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import TextField from '@mui/material/TextField';
import { Button } from 'antd';
import { useLoginStore } from '../hooks/useLoginStore';

export const LogIn = () => {
    const navigate = useNavigate();
    const { logIn, logOut } = useLoginStore();

    useEffect(() => logOut(), [logOut]);

    const handleLogin = () => {
        logIn();
        navigate('/home');
    }

    return (
    <>
        <div className='d-flex' style={{height: '100vh'}}>
            <div className='d-flex flex-column justify-content-center align-items-center' style={{width: '50vw'}}>
                <h3 className='title-s'>Inicio de Sesión</h3>
                <TextField
                    label="Usuario"
                    variant="outlined"
                    sx={{ '& .MuiInputBase-root': { height: '50px', width: '300px' } }}
                />
                <span style={{height: '16px'}}></span>
                <TextField
                    type='password'
                    label="Contraseña"
                    variant="outlined"
                    sx={{ '& .MuiInputBase-root': { height: '50px', width: '300px' } }}
                />
                <span style={{height: '16px'}}></span>
                <Button key="complete" type="primary" className='solid-primary' onClick={handleLogin}>
                    Iniciar Sesión
                </Button>
                <span style={{height: '48px'}}></span>
                <Button key="complete" type="text" onClick={() => navigate('/password_recovery')}>
                    <p sx={{textDecoration: 'underline'}}>¿Olvidaste tu contraseña?</p>
                </Button>
                <span style={{height: '1px', width: '170px', backgroundColor: 'black'}}></span>
            </div>
            <div className='d-flex flex-column  justify-content-center align-items-center pb-5' style={{backgroundColor: '#083D77', width: '50vw'}}>
                <img src="logo.png" alt="logo icon" width={255} height={255} />
                <img src="nombreApp.png" alt="logo name" width={255} />
            </div>
        </div>
    </>
)   ;
}