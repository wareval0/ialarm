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

  return (
    <div className='container'>
      <Row style={{ paddingTop: '20px', backgroundColor: 'white' }} justify="space-evenly"> 
        <Col span={4}>
          <Filtros filters={filters} setFilters={setFilters} />
        </Col>

        <Col span={18}>
          <Calendar filters={filters} />
        </Col>
      </Row>
    </div>
  );
}

export default PageCalendar;
