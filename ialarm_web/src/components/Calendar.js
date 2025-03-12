import React from 'react';
import { Calendar, ConfigProvider, Select, Row, Col } from 'antd';
import dayjs from "dayjs";
import 'dayjs/locale/es'; 
import { CheckOutlined, EditOutlined, ExclamationOutlined} from '@ant-design/icons'; // Importa íconos
import "./Calendar.css";
import es_ES from 'antd/es/locale/es_ES'; // Importa la localización en español
import CustomSwitch from './CustomSwitch';

dayjs.locale("es"); 

const eventIcons = {
    warning: <CheckOutlined style={{ color: '#2E4057' }} />,
    success: <EditOutlined style={{ color: 'white' }} />,
    error: <ExclamationOutlined style={{ color: 'white' }} />
};

const getListData = (value, filters) => {
    let listData = [];
    switch (value.date()) {
        case 11:
            if (filters.lejano) {
                listData = [{ type: 'warning', content: 'Tarea Completada' }];
            }
            break;
        case 16:
            if (filters.urgente) {
                listData = [
                    { type: 'error', content: 'Tarea Urgente' }
                ];
            }
            break;
        case 20:
            if (filters.proximo) {
                listData = [
                    { type: 'success', content: 'Tarea Pendiente' },
                ];
            }
            break;
        default:
    }
    return listData;
};

const dateCellRender = (value, filters) => {
    const listData = getListData(value, filters);
    return (
        <ul className="events">
            {listData.map((item) => (
                <li 
                    key={item.content} 
                    onClick={() => alert(`Evento: ${item.content}`)} 
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

const App = ({ filters }) => {
    return (
        <ConfigProvider locale={es_ES}> {/* Aplica la localización en español */}
            <Calendar  cellRender={(date, info) => (info.type === 'date' ? dateCellRender(date, filters) : info.originNode)} 
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
        </ConfigProvider>
    );
};

export default App;
