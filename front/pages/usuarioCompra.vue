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

      <div class="container-compra">
        <div class="compra__content">
            <div class="compra__data">
                <Divider align="left" class="m-0">
                  <p class="mb-0 title-divider">Datos de la compra</p>
                </Divider>
                <div class="data__row">
                    <div class="inputGroup">
                        <label for="idCompra" class="inputGroup___label">ID Compra</label>
                        <InputText name="idCompra" id="idCompra" disabled value="ID de la compra" class="p-inputtext-sm inputGroup__input" />
                    </div>

                    <div class="inputGroup">
                        <label for="sorteo" class="inputGroup___label">Sorteo</label>
                        <InputText id="sorteo" disabled value="Nombre/id sorteo" class="p-inputtext-sm inputGroup__input" />
                    </div>

                    <div class="inputGroup">
                        <label for="fechaCompra" class="inputGroup___label">Fecha de la compra</label>
                        <Calendar id="fechaCompra" dateFormat="dd/mm/yy" class="w-100"/>
                    </div>
                </div>    

                <div class="data__row">
                    <div class="inputGroup">
                        <label for="ticketsFirst" class="inputGroup___label">Número inicial de tickets</label>
                        <InputText id="ticketsFirst" disabled value="10" class="p-inputtext-sm inputGroup__input" />
                    </div>
    
                    <div class="inputGroup">
                        <label for="promoCode" class="inputGroup___label">Código Promocional</label>
                        <InputText id="promoCode" disabled value="codigoPromocional001" class="p-inputtext-sm inputGroup__input" />
                    </div>
    
                    <div class="inputGroup">
                        <label for="ticketsFinal" class="inputGroup___label">Número final de tickets</label>
                        <InputText id="ticketsFinal" disabled value="50" class="p-inputtext-sm inputGroup__input" />
                    </div>
                </div>

                <div class="data__monto">
                    <div class="monto__label">
                        Monto total: 
                    </div>
                    <InputText type="text" value="S/. 140" class="p-inputtext-sm monto__input" />
                </div>
            </div>


            <div class="compra__user">
                <Divider align="left" class="m-0">
                  <p class="mb-0 title-divider">Datos del usuario</p>
                </Divider>
                <div>
                    <PrimeButton class="p-button-sm" label="Iniciar Sesión"/> o en caso de no estar registrado, llena tus datos a continuación:
                </div>
                <div class="data__row">
                    <div class="inputGroup">
                        <label for="dni" class="inputGroup___label">DNI</label>
                        <InputText id="dni" class="p-inputtext-sm inputGroup__input" />
                    </div>

                    <div class="inputGroup">
                        <label for="telefono" class="inputGroup___label">Teléfono</label>
                        <InputMask mask="999 999 999" class="inputGroup__input" id="telefono"/>
                    </div>

                    <div class="inputGroup">
                        <label for="email" class="inputGroup___label">Correo electrónico</label>
                        <InputText id="email" type="email" class="p-inputtext-sm inputGroup__input w-100">
                        </InputText>
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
    props: {
      
    },
    data() {
      return {
        
      };
    },
    computed: {
      
    },
    methods: {
      
    },
    mounted() {
      
    },
    created() {
      
    },
    watch: {
      
    }
}
</script>
  
<style scoped lang='scss'>
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
  
.title-divider {
    font-size: 0.9rem;
}

.container-compra {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;

    .compra {
        &__content{
            width: 60%;

            .data {
                &__row {
                    display:grid;
                    grid-template-columns: repeat(3,1fr);
                    gap: 10px;
                }
        
                &__monto {
                    margin-top: 20px;
                    width: 100%;
                    display: flex;
                    justify-content: center;
        
                    .monto{
                        &__label {
                            margin-right: 10px;
                        }
                    }
                }
            }
        }

        &_data, &user, &_method {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        &__method {
            .radio-wrapper {
                display: flex;
                justify-content: space-between;
                width: 100%;
                padding: 10px;
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

    } 
}

.inputGroup {
    &__label {
        width: 100%;
        font-size: 0.8rem !important;
        margin-bottom: 0.2rem !important;
    }

    &__input {
        width: 100%;
    }
}
</style>