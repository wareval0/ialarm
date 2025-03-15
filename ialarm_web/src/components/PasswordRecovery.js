import React, { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import { ExclamationCircleOutlined } from '@ant-design/icons';
import { Modal, Button } from 'antd';
import { useLoginStore } from '../hooks/useLoginStore';
import TextField from '@mui/material/TextField';

export const PasswordRecovery = () => {
    const navigate = useNavigate();
    const { logIn, logOut } = useLoginStore();
    const [otp, setOtp] = useState(['', '', '', '', '', '']);
    const [isModalOpen, setIsModalOpen] = useState(false);
    const inputRefs = useRef([]);

    useEffect(() => logOut(), [logOut]);

    const handleLogin = () => {
        logIn();
        navigate('/home');
    };

    const handleInputChange = (e, index) => {
        const newOtp = [...otp];
        newOtp[index] = e.target.value;

        setOtp(newOtp);

        if (e.target.value && index < inputRefs.current.length - 1) {
            inputRefs.current[index + 1].focus();
        }

        if (newOtp.every((item) => item !== '')) {
            showModal();
        }
    };

    const showModal = () => {
        setIsModalOpen(true);
    };

    return (
        <>
            <div style={{ height: '100vh' }}>
                <div
                    className="d-flex flex-row justify-content-center align-items-center"
                    style={{ width: '100vw', backgroundColor: '#083D77', padding: '20px' }}
                >
                    <Link to="/">
                        <img src="logo.png" alt="logo icon" width={80} height={80} />
                        <span style={{ width: '16px' }}></span>
                        <img src="nombreApp.png" alt="logo name" width={190} />
                    </Link>
                </div>

                <div className="d-flex flex-column align-items-center">
                    <h3 className="title-s" style={{ marginBottom: '8px' }}>
                        Recuperación de Contraseña
                    </h3>
                    <p className="body-s">
                        Hemos enviado un código OTP al correo l.p*******@uniandes.edu.co
                    </p>
                </div>

                <div style={{ width: '100%', padding: '0 80px' }}>
                    <p className="body-l">Código OTP</p>
                    <span
                        style={{ display: 'block', width: '100%', height: '1px', backgroundColor: 'black' }}
                    ></span>
                </div>

                <div
                    className="d-flex flex-column justify-content-center align-items-center"
                    style={{ width: '100%', padding: '0 80px' }}
                >
                    <p className="body-m">Ingrese el código de recuperación</p>
                    <div
                        className="d-flex flex-row justify-content-center align-items-center"
                        style={{ gap: '10px', marginTop: '20px' }}
                    >
                        {otp.map((value, index) => (
                            <React.Fragment key={index}>
                                <input
                                    type="text"
                                    maxLength="1"
                                    style={inputStyle}
                                    value={value}
                                    ref={(el) => (inputRefs.current[index] = el)}
                                    onInput={(e) => handleInputChange(e, index)}
                                />
                                {(index === 1 || index === 3) && (
                                    <span style={separatorStyle}>—</span>
                                )}
                            </React.Fragment>
                        ))}
                    </div>
                </div>

                <div
                    className="d-flex flex-row justify-content-start align-items-start"
                    style={{ width: '100%', padding: '0 80px', marginTop: '80px', gap: '16px' }}
                >
                    <ExclamationCircleOutlined style={{ fontSize: '50px' }} />
                    <div className="d-flex flex-column justify-content-center align-items-start">
                        <span style={textStyle}>
                            Si no ha recibido nada en su correo, puede{' '}
                            <span style={linkStyle}>solicitar un nuevo código</span>
                        </span>
                    </div>
                </div>
            </div>
            <Modal 
                title={
                    <div className='d-flex flex-row justify-content-center align-items-center'>
                        <p className='body-l'>Nueva contraseña</p>
                    </div>
                }
                open={isModalOpen}
                closable={false}
                footer={[
                    <Button type="primary" className='solid-primary' onClick={handleLogin} style={{marginBottom: '16px', backgroundColor: '#083D77'}}>
                        Confirmar
                    </Button>
                ]}
                >
                <div className='d-flex flex-column justify-content-center align-items-center'>
                    <TextField
                        type='password'
                        label="Nueva Contraseña"
                        variant="outlined"
                        sx={{ '& .MuiInputBase-root': { height: '50px', width: '300px' } }}
                    />
                    <span style={{height: '16px'}}></span>
                    <TextField
                        type='password'
                        label="Confirmar Contraseña"
                        variant="outlined"
                        sx={{ '& .MuiInputBase-root': { height: '50px', width: '300px' } }}
                    />
                    <span style={{height: '32px'}}></span>
                </div>
            </Modal>
        </>
    );
};

const inputStyle = {
    width: '70px',
    height: '70px',
    textAlign: 'center',
    backgroundColor: '#2E4057',
    color: 'white',
    fontSize: '50px',
    fontFamily: 'Roboto Flex',
    border: 'none',
    borderRadius: '5px',
};

const separatorStyle = {
    fontSize: '50px',
    color: 'black',
};

const textStyle = {
    color: '#2E4057',
    fontFamily: 'Roboto Flex',
    fontSize: '24px',
    fontStyle: 'normal',
    fontWeight: '400px',
};

const linkStyle = {
    color: '#2E4057',
    fontFamily: 'Roboto Flex',
    fontSize: '24px',
    fontStyle: 'normal',
    fontWeight: '400px',
    textDecoration: 'underline',
    cursor: 'pointer',
};
