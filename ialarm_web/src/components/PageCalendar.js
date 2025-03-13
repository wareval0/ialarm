import React, { useState } from 'react';
import Calendar from './Calendar';
import { Col, Row } from 'antd';
import Filtros from './Filtros';
import "./PageCalendar.css";

function PageCalendar() {
  const [filters, setFilters] = useState({
    urgente: true,
    proximo: true,
    lejano: true
  });

  const [checked, setChecked] = useState(['DSW', 'DALGO', 'Sistrans', 'UX', 'TI']); // Estado para los checkboxes

  return (
    <div className='container'>
      <Row style={{ paddingTop: '20px', backgroundColor: 'white' }} justify="space-evenly"> 
        <Col span={4}>
          <Filtros filters={filters} setFilters={setFilters} checked={checked} setChecked={setChecked} /> {/* Pasa checked y setChecked */}
        </Col>

        <Col span={18}>
          <Calendar filters={filters} checked={checked} /> {/* Pasa checked */}
        </Col>
      </Row>
    </div>
  );
}

export default PageCalendar;
