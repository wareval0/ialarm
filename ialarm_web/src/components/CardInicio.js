import * as React from 'react';
import { useTheme } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';

export default function MediaControlCard(props) {
    const theme = useTheme();

    return (
        <Card sx={{ display: 'flex'}}>
            <Box sx={{ display: 'flex', flexDirection: 'column'}}>
                <CardContent sx={{ flex: '1 0 auto' }}>
                <Typography component="div" variant="h5" style={{color: 'white', fontWeight: 'bold'}}>
                    {props.title}
                </Typography>
                <Typography
                    style={{color: 'white'}}
                    variant="body2"
                    component="div"
                    sx={{ color: 'text.secondary' }}
                >
                    {props.description}
                </Typography>
                </CardContent>
            </Box>
            <CardMedia
                component="img"
                sx={{ width: 151 }}
                image={props.image}
                alt="Live from space album cover"
            />
        </Card>
        
    );
}
