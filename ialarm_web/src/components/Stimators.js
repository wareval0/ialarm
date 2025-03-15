import React, { useState } from 'react';
import { Button, Modal } from 'antd';

export const Stimators = () => {
    const [isModalOpen, setIsModalOpen] = useState(false);

    const showModal = () => {
        setIsModalOpen(true);
    };

    const handleOk = () => {
        setIsModalOpen(false);
    };

    const handleCancel = () => {
        setIsModalOpen(false);
    };

    return (
        <>
            <div style={{ height: '100%' }}>
                <div className="d-flex flex-column align-items-center">
                    <h3 className="title-s" style={{ marginBottom: '8px' }}>
                        Selecciona tu modelo de estimación
                    </h3>
                    <p className="body-s" style={{ textAlign: 'center' }}>
                        Escoge el estimador que más se adapte a ti, para obtener mayor precisión
                        <br></br>
                        ¡Qué nunca más se te pase una tarea!
                    </p>
                </div>

                <div style={{ width: '100%', padding: '0 80px' }}>
                    <p className="body-l">Modelo actual</p>
                    <span
                        style={{ display: 'block', width: '100%', height: '1px', backgroundColor: 'black' }}
                    ></span>
                </div>

                <CardModelDetail
                    title='Modelo general de estimación y predicción'
                    shortDescription='Modelo balanceado ideal para estudiantes universitarios. (Predeterínado)'
                    image='current_model.png'
                />

                <div style={{ width: '100%', padding: '0 80px' }}>
                    <p className="body-l">Otros modelos</p>
                    <span
                        style={{ display: 'block', width: '100%', height: '1px', backgroundColor: 'black' }}
                    ></span>
                </div>

                <CardModel 
                    department='ISIS'
                    title='Modelo estimador ISIS'
                    shortDescription='Modelo enfocado a los estudiantes de ingeniería de sistemas y computación.'
                    image='isis_model.png'
                    onClick={showModal}
                />

                <CardModel 
                    department='ARQ'
                    title='Modelo estimador ARQDIS'
                    shortDescription='Modelo enfocado a los estudiantes de la facultad de arquitectura y diseño.'
                    image='arq_model.png'
                    onClick={showModal}
                />

                <CardModel 
                    department='IMEC'
                    title='Modelo estimador IMEC I'
                    shortDescription='Modelo enfocado a los estudiantes de ingeniería mecánica pertenecientes a los cursos tipo 1.'
                    image='imec_model.png'
                    onClick={showModal}
                />

                <CardModel 
                    department='IMEC'
                    title='Modelo estimador IMEC II'
                    shortDescription='Modelo enfocado a los estudiantes de ingeniería mecánica pertenecientes a los cursos tipo 2.'
                    image='imec_model.png'
                    onClick={showModal}
                />

                <span style={{ display: 'block', height: '16px' }}></span>

                <div className='d-flex flex-column align-items-center'>
                    <Button type="primary" variant="outlined" className='outline-primary'>
                        Ver más
                    </Button>
                </div>

                <span style={{ display: 'block', height: '48px' }}></span>

            </div>
            <Modal 
                title={
                    <div className='d-flex flex-row' style={{ padding: '0 35px'}}>
                        <p className='body-l' style={{ paddingBottom: '0', marginBottom: '0'}}>Seleccionar modelo</p>
                    </div>
                }
                open={isModalOpen}
                onOk={handleOk}
                onCancel={handleCancel}
                width={600}
                footer={[
                    <Button type="primary" variant="outlined" className='outline-primary' onClick={handleCancel} style={{marginBottom: '16px'}}>
                        Cancelar
                    </Button>,
                    <Button type="primary" className='solid-primary' onClick={handleOk} style={{marginBottom: '16px', backgroundColor: '#083D77'}}>
                        Seleccionar
                    </Button>
                ]}
                >
                <div className='d-flex flex-column justify-content-center align-items-center'>
                    <CardModelDetail
                        title='Modelo estimador ARQDIS'
                        shortDescription='Modelo enfocado a los estudiantes de la facultad de arquitectura y diseño.'
                        image='arqdis_model.png'
                    />
                    <span style={{height: '16px'}}></span>
                    <p className='body-l' style={{ paddingBottom: '0', marginBottom: '0'}}>Modelo estimador ARQDIS</p>
                    <div style={{ width: '100%', padding: '0 40px' }}>
                        <p className='body-s'>Modelo diseñado para ayudar a los estudiantes de arquitectura y diseño a estimar el tiempo necesario para sus tareas y proyectos. Utilizando variables relacionadas con la carga de trabajo, complejidad y experiencia, ofrece estimaciones precisas que mejoran la planificación y gestión del tiempo, facilitando el cumplimiento de plazos.</p>
                    </div>
                    <span style={{height: '8px'}}></span>
                </div>
            </Modal>
        </>
    );
}

const CardModel = (props) => {
    return (
        <div className='d-flex justify-content-center align-items-center' style={{ marginTop: '20px', cursor: 'pointer' }} onClick={props.onClick}>
            <div 
            className='d-flex flex-row' 
            style={{ width: '500px', height: '100px'}}
            >
                <div className='d-flex flex-column justify-content-center align-items-center' style={{ width: '15%', backgroundColor: '#D9F0FF', borderRadius: '10px 0 0 10px'}}>
                    <div className='d-flex flex-column justify-content-center align-items-center' style={{ width: '60px', height: '60px', borderRadius: '100%', overflow: 'hidden', backgroundColor: 'white' }}>
                        <p style={{ fontSize: '24px', color:'#083D77' }}>{props.department}</p>
                    </div>
                </div>
                <div className='d-flex flex-column justify-content-center' style={{ width: '65%', backgroundColor: '#D9F0FF', padding: '10px'}}>
                    <p style={textStyleBold}>{ props.title }</p>
                    <p style={textStyle}>{ props.shortDescription }</p>
                </div>
                <div style={{ width: '20%', height: '100%', borderRadius: '0 10px 10px 0', overflow: 'hidden', padding: '16px' }}>
                    <img
                        src={ props.image }
                        alt={ props.image }
                        style={{
                            width: '100%',
                            height: '100%',
                            objectFit: 'cover',
                        }}
                    />
                </div>
            </div>
        </div>
    );
}

const CardModelDetail = (props) => {
    return (
        <div className='d-flex justify-content-center align-items-center' style={{ marginTop: '20px' }}>
            <div 
            className='d-flex flex-row' 
            style={{ width: '500px', height: '250px'}}
            >
                <div className='d-flex flex-column justify-content-center align-items-center' style={{ width: '50%', backgroundColor: '#083D77', borderRadius: '10px 0 0 10px', padding: '19px'}}>
                    <p style={textStyleBoldWhite}>{ props.title }</p>
                    <p style={textStyleWhite}>{ props.shortDescription }</p>
                </div>
                <div style={{ width: '50%', height: '100%', borderRadius: '0 10px 10px 0', overflow: 'hidden'}}>
                    <img
                        src={ props.image }
                        alt={ props.image }
                        style={{
                            width: '100%',
                            height: '100%',
                            objectFit: 'cover',
                        }}
                    />
                </div>
            </div>
        </div>
    );
}

const textStyleBoldWhite = {
    color: 'white',
    fontFamily: 'Roboto Flex',
    fontSize: '24px',
    fontStyle: 'normal',
    fontWeight: '500px',
};

const textStyleWhite = {
    color: 'white',
    fontFamily: 'Roboto Flex',
    fontSize: '16px',
    fontStyle: 'normal',
    fontWeight: '200px',
    marginTop: '0',
    paddingTop: '0',
}

const textStyleBold = {
    color: '#2E4057',
    fontFamily: 'Roboto Flex',
    fontSize: '24px',
    fontStyle: 'normal',
    fontWeight: '500px',
    marginTop: '0',
    paddingTop: '10px',
    marginBottom: '10px',
    paddingBottom: '0',
};

const textStyle = {
    color: '#2E4057',
    fontFamily: 'Roboto Flex',
    fontSize: '14px',
    fontStyle: 'normal',
    fontWeight: '200px',
    marginTop: '0',
    paddingTop: '0',
}