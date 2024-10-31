<template>
    <div class="content-page">
      <header class="header">
        <div class="header__content">
          <div class="header__img">
            <img src="/img/LoteriaLogo.jpeg" alt="logo">
          </div>
        </div>
      </header>
  
      <div class="container-compra">
        <div class="compra__content">
          <div class="compra__data">
            <Divider align="left" class="m-0">
              <p class="mb-0 title-divider">Datos de la compra</p>
            </Divider>
            <div class="data__row">
              <div class="inputGroup">
                <label for="idCompra" class="inputGroup___label">Sorteo</label>
                <InputText name="idCompra" id="idCompra" disabled :value="receivedData.nombreSorteo" class="p-inputtext-sm inputGroup__input" />
              </div>
  
              <div class="inputGroup">
                <label for="fechaSorteo" class="inputGroup___label">Fecha del sorteo</label>
                <Calendar id="fechaSorteo" :readonly="true" class="w-100" v-model="receivedData.fechaSorteo"/>
              </div>
              
              <div class="inputGroup">
                <label for="montoCompra" class="inputGroup___label">Monto de la compra</label>
                <InputText type="text" disabled v-model="receivedData.monto" id="montoCompra" class="p-inputtext-sm inputGroup__input" />
              </div>
              
              <div class="inputGroup">
                <label for="ticketsInicial" class="inputGroup___label">Número inicial de Tickets</label>
                <InputText type="text" disabled v-model="receivedData.ticketsInicial" id="ticketsInicial" class="p-inputtext-sm inputGroup__input" />
              </div>
              
              <div class="data__row">
                  <div class="inputGroup">
                    <label for="promoCode" class="inputGroup___label">Código Promocional</label>
                    <InputText id="promoCode" disabled v-model="receivedData.codigoInfluencer" class="p-inputtext-sm inputGroup__input" />
                  </div>
              </div>
  
              <div class="inputGroup">
                <label for="ticketsFinal" class="inputGroup___label">Número final de tickets</label>
                <InputText v-model="receivedData.tickets" id="ticketsFinal" disabled class="p-inputtext-sm inputGroup__input" />
              </div>
            </div>    
          </div>
  
          <div class="compra__user">
            <Divider align="left" class="m-0">
              <p class="mb-0 title-divider">Datos del usuario</p>
            </Divider>
            <div class="data__row">
              <div class="inputGroup">
                <label for="usuario" class="inputGroup___label">Usuario</label>
                <InputText :disabled="true" id="usuario" class="p-inputtext-sm inputGroup__input" v-model="$auth.user.nombreUsuario"/>
              </div>
  
  
              <div class="inputGroup">
                <label for="nombre" class="inputGroup___label">Nombre</label>
                <InputText :disabled="true" id="nombre" class="p-inputtext-sm inputGroup__input" v-model="$auth.user.nombres"/>
              </div>
  
              <div class="inputGroup">
                <label for="apellido" class="inputGroup___label">Apellido</label>
                <InputText :disabled="true" id="apellido" class="p-inputtext-sm inputGroup__input" v-model="$auth.user.apellidos"/>
            </div>

              <div class="inputGroup">
                <label for="dni" class="inputGroup___label">DNI</label>
                <InputText :disabled="true" id="dni" class="p-inputtext-sm inputGroup__input" v-model="$auth.user.dni"/>
              </div>
  
              <div class="inputGroup">
                <label for="telefono" class="inputGroup___label">Teléfono</label>
                <InputMask :disabled="true" mask="999 999 999" class="inputGroup__input w-100" id="telefono" v-model="$auth.user.celular"/>
              </div>
  
              <div class="inputGroup">
                <label for="email" class="inputGroup___label">Correo electrónico</label>
                <InputText :disabled="true" id="email" type="email" class="p-inputtext-sm inputGroup__input w-100" v-model="$auth.user.email"/>
              </div>
            </div>
          </div>
  
          <div class="compra__method">
            <Divider align="left" class="m-0">
              <p class="mb-0 title-divider">Método de pago</p>
            </Divider>
            <div class="radio-wrapper">
              <div class="radio-option">
                <input type="radio" id="debitCard" name="method" value="debitCard">
                <label for="debitCard">Tarjeta de Debito</label>
              </div>
  
              <div class="radio-option">
                <input type="radio" id="creditCard" name="method" value="creditCard">
                <label for="creditCard">Tarjeta de Crédito</label>
              </div>
  
              <div class="radio-option">
                <input type="radio" id="yape" name="method" value="yape">
                <label for="yape">Yape</label>
              </div>
  
              <div class="radio-option">
                <input type="radio" id="plin" name="method" value="plin">
                <label for="plin">Plin</label>
              </div>
            </div>
  
            <div class="button-wrapper">
              <PrimeButton label="Continuar con la compra" class="p-button-sm"/>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import Divider from 'primevue/divider'
  import InputText from 'primevue/inputtext'
  import Calendar from 'primevue/calendar'
  import InputMask from 'primevue/inputmask'
  import PrimeButton from 'primevue/button'
  
  export default {
    name: 'usuarioCompra',
    components: {
      Divider,
      InputText,
      Calendar,
      InputMask,
      PrimeButton
    },
    data() {
      return {
        fechaHoy: new Date(),
        receivedData: {
          tickets: this.$route.query.tickets || 0,
          monto: this.$route.query.monto || 0,
          ticketsInicial: this.$route.query.ticketsInicial || 0,
          codigoInfluencer: this.$route.query.codigoInfluencer || '',
          nombreSorteo: this.$route.query.nombreSorteo || '',
          fechaSorteo: this.$route.query.fechaSorteo || ''
        }
      }
    },
    mounted() {    
      console.log(this.$auth.user)
    },
  }
  </script>
  
  <style scoped lang='scss'>
  * {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
  }
  
  .content-page {
    display: flex;
    flex-direction: column;
    height: 100vh;
    background-color: #f4f4f4;
  }
  
  .title-divider {
    font-size: 0.9rem;
  }
  
  .container-compra {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .compra__content {
    width: 60%;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .data__row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
  
    @media (max-width: 768px) {
      grid-template-columns: repeat(2, 1fr);
    }
  
    @media (max-width: 480px) {
      grid-template-columns: 1fr;
    }
  }
  
  .inputGroup {
    flex: 1;
    min-width: 200px;
  }
  
  .inputGroup___label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  
  .p-inputtext-sm {
    width: 100%;
  }
  
  .compra__method {
    .radio-wrapper {
      display: flex;
      justify-content: space-between;
      width: 100%;
      padding: 10px;
  
      @media (max-width: 480px) {
        flex-direction: column;
        gap: 10px;
      }
    }
  
    .radio-option {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
  
    label {
      margin-top: 5px;
    }
  
    .button-wrapper {
      display: flex;
      justify-content: flex-end;
      width: 100%;
      padding: 20px;
      box-sizing: border-box;
  
      @media (max-width: 480px) {
        justify-content: center;
      }
    }
  
    .button-wrapper .p-button-sm {
      padding: 10px 20px;
      background-color: #fb292a !important;
      color: white !important;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
  
    .button-wrapper button:hover {
      background-color: #e02727 !important;
    }
  }
  
  header {
    width: 100%;
    height: 100px;
    background-color: #FB292A;
  }
  
  .header__content {
    width: 60%;
    height: 100%;
    margin: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
  
    @media (max-width: 768px) {
      width: 80%;
    }
  
    @media (max-width: 480px) {
      width: 90%;
    }
  }
  
  .header__img {
    width: 65px;
    height: 65px;
    border-radius: 100%;
    background: #fff;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .header__img img {
    width: 90%;
    border-radius: 100%;
  }
  
  .header__buttons button {
    border: 1px solid #fff;
    border-radius: 4px;
    text-align: center;
    padding: 10px;
    color: #fff;
    height: 35px;
    background-color: transparent;
  }
  
  .header__buttons .buttons__login {
    margin-left: 20px;
  }
  </style>