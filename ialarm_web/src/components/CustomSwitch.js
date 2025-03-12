import { styled } from '@mui/material/styles';
import Switch from '@mui/material/Switch';

const CustomSwitch = styled((props) => (
  <Switch focusVisibleClassName=".Mui-focusVisible" disableRipple {...props} />
))(({ theme }) => ({
  width: 42,
  height: 26,
  padding: 0,
  '& .MuiSwitch-switchBase': {
    padding: 0,
    margin: 2,
    transitionDuration: '300ms',
    '&.Mui-checked': {
      transform: 'translateX(16px)',
      color: '#fff',
      '& + .MuiSwitch-track': {
        backgroundColor: '#003366', // Fondo azul oscuro cuando está activado
        opacity: 1,
        border: 0,
      },
    },
    '&.Mui-disabled + .MuiSwitch-track': {
      opacity: 0.5,
    },
  },
  '& .MuiSwitch-thumb': {
    width: 22,
    height: 22,
    boxSizing: 'border-box',
    backgroundColor: '#fff', // Círculo blanco
  },
  '& .MuiSwitch-track': {
    borderRadius: 26 / 2,
    backgroundColor: '#ccc', // Color gris cuando está desactivado
    opacity: 1,
    transition: theme.transitions.create(['background-color'], {
      duration: 500,
    }),
  },
}));

export default CustomSwitch;
