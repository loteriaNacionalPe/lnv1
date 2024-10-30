<template>
  <div class="content-page">
    <header class="header">
      <h1 class="header__title">Lotería Nacional</h1>

      <nav class="header__nav">
        <ul>
          <li class="nav__item"><a href="#">Inicio</a></li>
          <li class="nav__item"><a href="#">Juegos</a></li>
          <li class="nav__item"><a href="#">Perfil</a></li>
        </ul>
      </nav>
    </header>
    
    <div class="content">
      <div class="content__wrapper">
          <div class="ticketsContainer">
            <div @click="tomarValor(10, 50)" class="ticketsContainer__ticket">
              <h2>10</h2>
              <p>tickets</p>
            </div>
            <div @click="tomarValor(20, 100)" class="ticketsContainer__ticket">
              <h2>20</h2>
              <p>tickets</p>
            </div>
            <div @click="tomarValor(30, 150)" class="ticketsContainer__ticket">
              <h2>30</h2>
              <p>tickets</p>
            </div>
            <div @click="tomarValor(40, 200)" class="ticketsContainer__ticket">
              <h2>40</h2>
              <p>tickets</p>
            </div>
          </div>

          <div class="secondRow">
            <div class="customTickets">
              <label for="customTickets" class="customTickets__label">o puedes ingresar aquí tu propio número de tickets</label>
              <input v-model="ticketsManual" @change="cambiarManual()" type="number" name="customTickets" id="custom Tickets" class="customTickets__input" :disabled="disableManual">
            </div>

            <div class="promoCode">
              <input v-model="codigo" type="text" id="promoCode" placeholder="Código promocional" class="promoCode__input" :disabled="disableCode">
              <button @click="validarCodigo()" class="promoCode__button" :disabled="disableCode">Validar código</button>
              <button @click="limpiarCodigo()" class="promoCode__button" :disabled="disableClean">Limpiar</button>
            </div>
          </div>
          <div class="totalDiv">
            <button class="totalDiv__button">Pagar: S/. {{ montoPago }}</button>
            <p class="totalDiv__text">Tickets iniciales: {{ initialTickets }}</p>
            <p class="totalDiv__text">Total de tickets: {{ totalTickets }} (Código: {{ codigo }})</p>
          </div>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: 'index',
  components: {
    
  },
  props: {
    
  },
  data() {
    return {
      codigoInfluencer: {isValid: true, ticketsRegalo: 20},
      codigo: "",
      ticketsManual: 0,
      montoPago: 0,
      totalTickets: 0,
      initialTickets: 0,
      disableManual: false,
      disableCode: true,
      disableClean: true,
    };
  },
  computed: {
    
  },
  methods: {
    tomarValor(tickets, value) {
      this.ticketsManual = 0
      this.totalTickets = tickets
      this.initialTickets = tickets
      this.montoPago = value
      this.disableManual = true
      this.disableCode = false
    },
    validarCodigo() {

      if (this.codigoInfluencer.isValid) {
        this.totalTickets += this.codigoInfluencer.ticketsRegalo
        this.disableCode = true
        this.disableClean = false
      }
    },
    limpiarCodigo() {
      this.totalTickets = this.initialTickets
      this.disableCode = false
      this.codigo = ""
    },
    cambiarManual() {
      this.totalTickets = this.ticketsManual
      this.initialTickets = this.ticketsManual
      this.montoPago = this.ticketsManual * 5
      this.disableCode = false
    }
  },
  mounted() {
    
  },
  created() {
    
  },
  watch: {
    
  }
};
</script>

<style scoped lang='scss'>
body {
  padding: 0;
  margin: 0;
  // box-sizing: border-box;
}

.content-page {
  font-family: Arial, Helvetica, sans-serif;
  display: flex;
  flex-direction: column;
  height: 100vh;
  background-color: #f4f4f4;

  .header {
    background-color: #050e1f;
    color: #fff;
    padding: 15px;
    text-align: center;

    &__nav {
      margin-top: 10px;

      ul {
        list-style-type: none;
        display: flex;
        justify-content: center;
      }

      .nav__item {
        margin: 0 15px;

        a {
          text-decoration: none;
          color: #fff;
          font-weight: bold;
        }
      }
    }
  }

}

.content {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;

  &__wrapper {
    width: 80%;
    max-width: 800px;
    display: flex;
    flex-direction: column;
    gap: 10px;

    div {
      // background-color: #fb292a;
      padding: 15px;
      text-align: center;
      color: #fff;
      height: 100px; /* Ajusta la altura según tus necesidades */
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .ticketsContainer {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 10px;
      padding: 0;
      background-color: transparent;

      &__ticket{
        background-color: rgba(0,0,0,0.1);
        color: #050e1f;
        padding: 10px;
        border-radius: 10px;
        text-align: center;
        box-shadow: 2px 1px 4px 0px red;
        display:flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        // gap: 5px;
        font-family: Arial, Helvetica, sans-serif;

        h2 {
          font-size: 40px;
          font-weight: bold;
          // margin-bottom: 5px;
        }

        p {
          font-size: 30px;
        }
      }
    }
  }
}

.secondRow {
  display: flex;

  .customTickets {
    width: 50%;
    display:flex;
    justify-content: space-between;

    &__label {
      font-size: 16px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: #000;
      font-weight: 700;
      margin-right: 10px
    }

    &__input {
      height: 35px;
      text-align: center;
    }
  }

  .promoCode {
    width: 50%;
    display:flex;
    justify-content:center;

    &__input{
      height: 35px;
      width: 45%;
      // border-radius: 0px 10px 10px 0px;
      border: 1px solid #ccc;
      color: #000;
      text-align: center;
    }

    &__button {
      height: 35px;
      width: 55%;
      border-radius: 0px 10px 10px 0px;
      color:#fff;
      background-color: red;
      border: none;
      font-weight: 600;
    }
  }
}

.totalDiv {
  height: 40px;
  width: 100%;
  display: flex;
  justify-content: space-between;

  &__button {
    width: 70%;
    height: 100%;
    border: none;
    border-radius: 5px;
    background-color: rgba(0,0,0,0.8);
    color: #fff;
    font-size: 20px;
  }

  &__text { 
    width: 30%;
    font-size: 16px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #000;
    font-weight: 700;
    margin-right: 10px;
  }
}


</style>