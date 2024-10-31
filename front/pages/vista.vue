<template>
  <div>
    <header class="header">
      <div class="header__content">
        <div class="header__img">
          <img src="/img/LoteriaLogo.jpeg" alt="logo">
        </div>
      </div>
    </header>

    <div class="content-page">
      <div class="main-section">
        <div class="tickets">
          <p class="tickets__text">Seleccione un pack de tickets (con multiplicador)</p>
          <div class="tickets__container">
            <div 
              class="container__item" 
              v-for="pack in packs" 
              :key="pack.idPack" 
              @click="tomarValor(pack.monto, pack.multiplicador)"
            >
              <p class="item__number">{{ pack.monto }}</p>
              <p class="item__text">SOLES</p>
              <p class="item__text__monto">({{ pack.monto / 5 * pack.multiplicador }} tickets)</p>
            </div>
          </div>

          <p class="tickets__text">O escribe tu propio número:  (S/ 5 por ticket)</p>

          <div class="tickets__custom">
            <button @click="cambiarManual('minus')" class="custom__minus">-</button>
            <input :min="0" type="number" name="inputTickets" id="inputTickets" class="custom__input" value="25" @change="cambiarManual('manual')" :disabled="disableManual" v-model="ticketsManual">
            <button @click="cambiarManual('plus')" class="custom__plus">+</button>
          </div>
        </div> 

        <div class="promo">
          <p class="promo__text">Escribe aquí tu código promocional</p>
          <input type="text" v-model="codigo" name="inputPromo" id="inputPromo" class="promo__input">

          <template>
            <div class="button-container">
              <button class="promo__validar" @click="validarCodigo()" :disabled="disableCode">Validar</button>
              <button class="promo__validar" @click="limpiarCodigo()">Limpiar</button>
            </div>
          </template>

          <p class="promo__text">Número de tickets(iniciales): {{ initialTickets }}</p>
          <p class="promo__text">Número de tickets(finales): {{ totalTickets }}</p>
          <p class="promo__text">Total: S/{{ montoPago }}</p>
        </div>
      </div>

      <div class="comprar">
        <button @click="sendData()" class="comprar__button" :disabled="totalTickets <= 0">Continuar compra</button>
      </div>
    </div>
  </div>
</template>

<script>
import { juegosAxios } from '~/plugins/axios'
import PackOrganizer from '@/utils/PackOrganizer'

export default {
  name: 'index',
  data() {
    return {
      promoCodes: [],
      codigoInfluencer: {},
      selectedRaffle: {},
      selectedGame: {},
      codigo: "",
      packs: [],
      games: [],
      raffle: [],
      ticketsManual: 0,
      montoPago: 0,
      totalTickets: 0,
      initialTickets: 0,
      disableManual: false,
      disableCode: true,
      disableClean: true,
    }
  },
  computed: {
    organizedPacks() {
      const organizer = new PackOrganizer(this.packs)
      return organizer.organize()
    }
  },
  mounted() {
    this.getPromoCodes()
    this.getJuego()
    this.getSorteo() 
  },
  methods: {
    getJuego() {
      juegosAxios.get('/user/')
      .then((response) => {
        this.games = response.data
        this.selectedGame = this.games.find((game) => game.activo === true)
      })
    },
    getSorteo() {
      juegosAxios.get('/user/sorteo/')
      .then((response) => {
        this.raffle = response.data
        this.selectedRaffle = this.raffle.find((pack) => pack.activo === true)
        console.log(this.selectedRaffle)
      })
      .finally(() => {
        this.getTickets()
      })
    }, 
    getTickets() {
      juegosAxios.get(`/user/pack/packSorteo/${this.selectedRaffle.idSorteo}`)
        .then((response) => {
          this.packs = response.data
        })
        .catch(() => {
          this.$makeToast('error', 'error')
        })
    },
    getPromoCodes() {
      juegosAxios.get('/user/influencers/codigoPromocional/')
        .then((response) => {
          this.promoCodes = response.data
        })
        .catch(() => {
          this.$makeToast('error', 'error')
        })
    },
    tomarValor(tickets, multiplicador) {
      this.ticketsManual = 0
      this.totalTickets = tickets / 5 * multiplicador
      this.initialTickets = tickets / 5
      this.montoPago = tickets
      this.disableCode = false
    },
    validarCodigo() {
      this.codigoInfluencer = this.promoCodes.find((code) => code.codigo === this.codigo)
      
      if (this.codigoInfluencer) {
        this.$makeToast("success", "Código válido")
        if (this.codigoInfluencer.activo) {
            this.totalTickets *= this.codigoInfluencer.multiplicador
            this.disableCode = true
            this.disableClean = false
        }
      } else this.$makeToast("error", "Código inválido")
    },
    limpiarCodigo() {
      this.totalTickets = this.initialTickets
      this.disableCode = false
      this.codigo = ""
    },
    cambiarManual(option) {
      if (option === 'minus') {
        if (this.ticketsManual > 0) {
          this.ticketsManual--
        }
      } else if (option === 'plus') {
        this.ticketsManual++
      } else {
        this.ticketsManual = parseInt(this.ticketsManual)
      }
      this.totalTickets = this.ticketsManual
      this.initialTickets = this.ticketsManual
      this.montoPago = this.ticketsManual * 5
      this.disableCode = false
    },
    sendData() {
      if (this.codigoInfluencer.codigo === undefined) {
        this.codigoInfluencer.codigo = ''
      }
      const data = {
        tickets: this.totalTickets,
        monto: this.montoPago,
        ticketsInicial: this.initialTickets,
        codigoInfluencer: this.codigoInfluencer.codigo,
        nombreSorteo: this.selectedGame.nombre,
        fechaSorteo: this.selectedRaffle.fechaSorteo
      }
      this.$router.push({ 
        name: 'usuarioCompra', 
        query: data 
      })
    }
  }
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

.content-page {
  width: 60%;
  margin: auto;

  @media (max-width: 768px) {
    width: 80%;
  }

  @media (max-width: 480px) {
    width: 90%;
  }
}

.main-section {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-top: 50px;
  flex-wrap: wrap;
}

.tickets {
  height: 100%;
  width: 58.33%;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 30px;
  margin-bottom: 20px;

  @media (max-width: 768px) {
    width: 100%;
  }
}

.tickets__text {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
}

.tickets__container {
  width: 100%;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  margin-top: 20px;
  margin-bottom: 30px;

  @media (max-width: 768px) {
    grid-template-columns: repeat(2, 1fr);
  }

  @media (max-width: 480px) {
    grid-template-columns: 1fr;
  }
}

.container__item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.container__item:hover {
  background-color: #ffffff;
}

.container__item p {
  color: #000000;
  text-align: center;
}

.item__number {
  font-size: 20px; /* Ajusta el tamaño de la fuente según sea necesario */
  line-height: 1.2;
  margin: 0;
}

.item__text {
  font-size: 12px; /* Ajusta el tamaño de la fuente según sea necesario */
  line-height: 1.2;
  margin: 0;
}

.item__text__monto {
  font-size: 15px; /* Ajusta el tamaño de la fuente según sea necesario */
  line-height: 1.2;
  margin: 0;
}

.tickets__custom {
  margin-top: 20px;
  text-align: center;
}

.tickets__custom button {
  padding: 5px;
  height: 30px;
  background-color: #070D1C;
  color: #fff;
  font-size: 14px;
}

.custom__input {
  border: 1px solid #000;
  text-align: center;
  background-color: transparent;
  margin: 0 10px;
  height: 30px;
  border-radius: 8px;
}

.promo {
  width: 33.33%;
  padding: 30px;
  text-align: center;

  @media (max-width: 768px) {
    width: 100%;
  }
}

.promo__text {
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  margin: 10px 0;
}

.promo__input {
  border: 1px solid #000;
  text-align: center;
  background-color: transparent;
  height: 30px;
  width: 80%;
  margin: 10px auto 30px auto;
  border-radius: 8px;
}

.promo__validar {
  background: #FB292A;
  color: #fff;
  height: 30px;
  width: 60%;
  border: none;
  margin-bottom: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button-container {
  display: flex;
  gap: 10px;
}

.promo__validar {
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #FB292A;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.comprar {
  width: 100%;
  margin-top: 60px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.comprar__button {
  background-color: transparent;
  border: 2px solid #070D1C;
  color: #070D1C;
  font-weight: bold;
  text-align: center;
  font-size: 1.5rem;
  height: 50px;
  width: 345px;
  border-radius: 5px;
}
</style>