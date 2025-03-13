import React from "react";
import { Row, Col } from "antd";
import CardInicio from "./CardInicio";

function Inicio() {
  return (
    <div className="container" style={{padding: "0 2em", backgroundColor: "red"} }>

    <div style={{padding: '1em 5em', backgroundColor: 'white' }}>
      <header>
        <h1 style={{color: '#2E4057', fontSize: '4em', fontWeight: '900', margin: "0"}}>IA Alarm</h1>
        <p style={{marginTop: 0, fontSize: "1.5em"}}>La platafoma que te ayuda a organizar tu vida universitaria mediante alarmas.</p>
      </header>
      <div style={{ display: 'flex', justifyContent: 'center', width: '100%', padding: '1em 3em' }}>
        <Row gutter={[30, 30]} justify="center" style={{ width: '100%' }}>
          <Col xs={24} sm={12} md={12} lg={12}>
            <CardInicio title="Calendario" image="Media.png" description="Visualiza tus tareas de una forma fácil y sencilla" />
          </Col>
          <Col xs={24} sm={12} md={12} lg={12}>
            <CardInicio title="Estimadores" image="EstimadoresImg.png" description="Escoge el estimador que más se adapte a ti, para obtener más precisión y nunca más se te pase una tarea"/>
          </Col>
          <Col xs={24} sm={12} md={12} lg={12}>
            <CardInicio title="Perfil" image="PerfilImg.png" description="Visualiza tu perfil y conoce tus estadícticas"/>
          </Col>
          <Col xs={24} sm={12} md={12} lg={12}>
            <CardInicio title="Ajustes" image="AjustesImg.png" description="Personaliza y configura tu información y mejora tu experiencia."/>
          </Col>
        </Row>
      </div>
    </div> 
    </div>
  );
}

export default Inicio;