// middleware/auth.js
export default function ({ store, redirect, route }) {
    const isAuthenticated = store.state.auth.isAuthenticated // Asegúrate de que esto se ajuste a tu lógica
  
    // Rutas que no requieren autenticación
    const publicRoutes = ['/login', '/prueba', '/index'] // Agrega tus rutas públicas aquí
  
    if (!isAuthenticated && !publicRoutes.includes(route.path)) {
      return redirect('/login') // Redirige a login si no está autenticado
    }
  }