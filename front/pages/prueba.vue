<template>
    <div class="simple-page">
      <h1>Bienvenido a Mi Página Simple</h1>
      <p>Esta es una página de ejemplo en Nuxt.js.</p>
      <button @click="showMessage">Haz clic aquí</button>
      <p v-if="message">{{ message }}</p>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        message: '',
      };
    },
    methods: {
      showMessage() {
        this.message = '¡Hola! Has hecho clic en el botón.';
      },
    },
  };
  </script>
  
  <style scoped>
  .simple-page {
    text-align: center;
    margin-top: 50px;
  }
  
  button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
  }
  </style>