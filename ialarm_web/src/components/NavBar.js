import React from 'react';
import { AppBar, Toolbar, IconButton, Avatar, Link, Box } from '@mui/material';

function NavBar() {
    return (
        <AppBar position="static" sx={{ backgroundColor: '#083D77' }}>
            <Toolbar>
                <Link href="/home">
                    <img 
                        src="logo.png"
                        alt="Logo" 
                        style={{ height: 50, marginRight: "0.5em" }}
                    />
                </Link>
                <Link href="/home">
                    <img 
                        src="nombreApp.png"
                        alt="Logo" 
                        style={{ height: 30 }}
                    />
                </Link>
                <Box sx={{ display: 'flex', justifyContent: 'space-around'}}/>
                    <Link href="/home" sx={{ color: '#FFFFFF', mr: 2, '&:hover': { color: '#EF2D56' } }}>
                        Inicio
                    </Link>
                    <Link href="/calendario" sx={{ color: '#FFFFFF', mr: 2, '&:hover': { color: '#EF2D56' } }}>
                        Calendario
                    </Link>
                    <Link href="#" sx={{ color: '#FFFFFF', '&:hover': { color: '#EF2D56' } }}>
                        Estimadores
                    </Link>
                <Box />
                <Link href="/" sx={{ color: '#FFFFFF', '&:hover': { color: '#EF2D56' } }}>
                    <IconButton edge="end" color="inherit">
                        <Avatar />  
                    </IconButton>
                </Link>
                
            </Toolbar>
        </AppBar>
    );
}

export default NavBar;
