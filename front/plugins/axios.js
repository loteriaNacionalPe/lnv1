import axios from 'axios'

const userAxios = axios.create({
  baseURL: 'http://localhost:8001/api/usuarios', // Microservicio de usuarios
})

const juegosAxios = axios.create({
  baseURL: 'http://localhost:8002/api/juegos', // Microservicio de productos
})

// Puedes exportar cada instancia
export { userAxios, juegosAxios }