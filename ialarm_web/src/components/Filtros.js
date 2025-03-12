import * as React from 'react';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';
import Checkbox from '@mui/material/Checkbox';
import Switch from '@mui/material/Switch';
import Divider from '@mui/material/Divider';
import CustomSwitch from './CustomSwitch';
import "./Filtros.css";


export default function CheckboxListSecondary() {
    const [checked, setChecked] = React.useState([1, 2, 3, 4, 5]);
    const [switchState, setSwitchState] = React.useState({
        urgente: true,
        proximo: true,
        lejano: true
    });


    const values = {
        1: 'DSW',
        2: 'DALGO',
        3: 'Sistrans',
        4: 'UX',
        5: 'TI'
    }

    // Maneja cambios en los checkboxes
    const handleToggle = (value) => () => {
        const currentIndex = checked.indexOf(value);
        const newChecked = [...checked];

        if (currentIndex === -1) {
            newChecked.push(value);
        } else {
            newChecked.splice(currentIndex, 1);
        }

        setChecked(newChecked);
    };

    // Maneja cambios en los switches
    const handleSwitchChange = (name) => (event) => {
        setSwitchState({ ...switchState, [name]: event.target.checked });
    };

    

    return (
        <>
        <h2 style={{fontFamily: "Roboto"}}>Filtros</h2>
        <List dense sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
        {[1, 2, 3, 4, 5].map((value) => {
            const labelId = `checkbox-list-secondary-label-${value}`;
            return (
            <ListItem
                key={value}
                sx={{
                    color: '#2E4057', // Color del texto
                    fontSize: '1em', // Tamaño del texto
                    '& .MuiTypography-root': { fontSize: '1.3em'}, // Personaliza el texto primario
                }}
                secondaryAction={
                <Checkbox
                    edge="end"
                    onChange={handleToggle(value)}
                    checked={checked.includes(value)}
                    inputProps={{ 'aria-labelledby': labelId }}
                    sx={{
                        color: '#2E4057', // Color del checkbox cuando no está seleccionado
                        '&.Mui-checked': {
                            color: '#2E4057', // Color cuando está seleccionado
                        },
                    }}
                    
                />
                }
                disablePadding
            >
                <ListItemButton>
                <ListItemText id={labelId} primary={values[value]} />
                </ListItemButton>
            </ListItem>
            );
        }
        
        

        )}

         {/* Separador */}
        <Divider sx={{ margin: '10px 0' }} />

        {/* Switches */}
        {["Urgente", "Próximo", "Lejano"].map((label) => {
            const key = label.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();

            return (
                <ListItem key={key} disablePadding
                sx={{
                    color: '#2E4057', // Color del texto
                    fontSize: '1em', // Tamaño del texto
                    '& .MuiTypography-root': { fontSize: '1.3em'}, // Personaliza el texto primario
                }}
                >
                    <ListItemButton>
                        <ListItemText primary={label} />
                    </ListItemButton>
                    <CustomSwitch
                        checked={switchState[key]}
                        onChange={handleSwitchChange(key)}
                        />


                </ListItem>
            );
        })}
        </List>
        </>
    );
}