import React, { useState } from 'react';
import { Calendar, ConfigProvider, Select, Row, Col, Modal, Button } from 'antd';
import dayjs from "dayjs";
import 'dayjs/locale/es'; 
import { CheckOutlined, EditOutlined, ExclamationOutlined } from '@ant-design/icons'; // Importa íconos
import "./Calendar.css";
import es_ES from 'antd/es/locale/es_ES'; // Importa la localización en español
import RecipeReviewCard from './Card'; // Importa el componente Card

dayjs.locale("es"); 

const eventIcons = {
    warning: <CheckOutlined style={{ color: '#2E4057' }} />,
    success: <EditOutlined style={{ color: 'white' }} />,
    error: <ExclamationOutlined style={{ color: 'white' }} />
};

const getListData = (value, filters, checked) => {
    let listData = [];
    switch (value.date()) {
        case 11:
            if (filters.lejano) {
                listData = [{ type: 'warning', content: 'Tarea Completada', titulo: 'Taller de Desarollo de Software', deadline: "Completada :D", description: "Descripción de la tarea lorem ipsum dolor sit amet, consectetur adipiscing elit.", materia:"DSW" }];
            }
            break;
        case 16:
            if (filters.urgente) {
                listData = [
                    { type: 'error', content: 'Tarea Urgente', titulo: 'Proyecto 1 Dalgo', deadline: "12 de Marzo, 11:59 p.m.", description: "Descripción de la tarea lorem ipsum dolor sit amet, consectetur adipiscing elit.", materia:"DALGO" },
                ];
            }
            break;
        case 20:
            if (filters.proximo) {
                listData = [
                    { type: 'success', content: 'Tarea Pendiente', titulo: 'Proyecto UX', deadline: "12 de Marzo, 11:59 p.m.", description: "Descripción de la tarea lorem ipsum dolor sit amet, consectetur adipiscing elit.", materia:"UX" },
                ];
            }
            break;
        default:
    }

    // Filtrar eventos según los checkboxes seleccionados
    listData = listData.filter(item => checked.includes(item.materia));
    return listData;
};

const dateCellRender = (value, filters, checked, showModal) => {
    const listData = getListData(value, filters, checked);
    return (
        <ul className="events">
            {listData.map((item) => (
                <li 
                    key={item.content} 
                    onClick={() => showModal(item)} 
                    style={{ cursor: 'pointer', listStyle: 'none', display: 'flex', alignItems: 'center', gap: '5px' }}
                    className={`event-${item.type}`}
                >
                    {eventIcons[item.type]} {/* Muestra el ícono correspondiente */}
                    <span className='item-event'>{item.content}</span>
                </li>
            ))}
        </ul>
    );
};

const App = ({ filters, checked }) => {
    const [isModalVisible, setIsModalVisible] = useState(false);
    const [modalContent, setModalContent] = useState({});
    const [modalType, setModalType] = useState('');

    const showModal = (item) => {
        setModalContent(item);
        setModalType(item.type);
        setIsModalVisible(true);
    };

    const handleOk = () => {
        setIsModalVisible(false);
    };

    const handleCancel = () => {
        setIsModalVisible(false);
    };

    return (
        <ConfigProvider locale={es_ES}> {/* Aplica la localización en español */}
            <Calendar  
                cellRender={(date, info) => (info.type === 'date' ? dateCellRender(date, filters, checked, showModal) : info.originNode)} 
                headerRender={({ value, onChange }) => {
                    const monthOptions = [];
                    const yearOptions = [];
            
                    // Generar opciones de mes
                    for (let i = 0; i < 12; i++) {
                      monthOptions.push(
                        <Select.Option key={i} value={i}>
                          {dayjs().month(i).format("MMMM")}
                        </Select.Option>
                      );
                    }
            
                    // Generar opciones de año (por ejemplo, 2020-2030)
                    const currentYear = value.year();
                    for (let i = currentYear - 5; i <= currentYear + 5; i++) {
                      yearOptions.push(
                        <Select.Option key={i} value={i}>
                          {i}
                        </Select.Option>
                      );
                    }
            
                    return (
                      <Row justify="start" align="middle" style={{ padding: 8 }}>
                        {/* Selector de mes primero */}
                        <Col>
                          <Select
                            value={value.month()}
                            onChange={(newMonth) => onChange(value.month(newMonth))}
                            style={{ width: 120, marginRight: 8 }}
                          >
                            {monthOptions}
                          </Select>
                        </Col>
            
                        {/* Selector de año después */}
                        <Col>
                          <Select
                            value={value.year()}
                            onChange={(newYear) => onChange(value.year(newYear))}
                            style={{ width: 100 }}
                          >
                            {yearOptions}
                          </Select>
                        </Col>
                      </Row>
                    );
                  }}
                />
            <Modal 
                visible={isModalVisible} 
                onOk={handleOk} 
                onCancel={handleCancel}
                footer={[
                    modalType !== 'warning' && (
                        <Button key="complete" type="primary" onClick={handleOk}>
                            Completado
                        </Button>
                    )
                ]}
            >
                <RecipeReviewCard 
                    titulo={modalContent.titulo} 
                    deadline={modalContent.deadline} 
                    description={modalContent.description} 
                /> {/* Usa el componente Card como contenido del modal */}
            </Modal>
        </ConfigProvider>
    );
};

export default App;
