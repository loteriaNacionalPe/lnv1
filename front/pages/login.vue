<template>
  <div class="min-vh-100">
    <div class="loginContainer">
      <div class="loginContainer__main">
        <div class="main__signIn">
          <p class="signIn__text">Iniciar sesión</p>
        </div>

        <div class="main__group">
          <InputText placeholder="Usuario" id="usernameId" class="p-inputtext-sm group__input" v-model="loginData.dni" />
        </div>

        <div class="main__group">
          <Password placeholder="Contraseña" id="passwordId" class="p-inputtext-sm group__input"  v-model="loginData.contrasena" toggleMask  :feedback="false"/>
        </div>

        <div class="main__group">
          <PrimeButton label="Iniciar Sesión" class="w-100 p-button-info p-button-sm mt-3 group__login" @click="login()" />

          <a href="#" class="group__register w-100 my-4" @click="$openModal('modal-signup-form')">
            ¿No tienes una cuenta? Regístrate aquí
          </a>
        </div>
        
        <figure class="main__container-img">
          <img src="/img/LoteriaLogo.jpeg" alt="Lotería Nacional" class="main__img">
        </figure>
      </div>
    </div>
    
    <CustomModal id="modal-signup-form" :withHeader="true" :hideHeader="false" title="Registro de usuario" @onHide="$closeModal('modal-signup-form')" size="md">
      <SignUpForm />
    </CustomModal>
  </div>
</template>

<script>
import Button from 'primevue/button'
import InputText from 'primevue/inputtext'
import Password from 'primevue/password'
// import Language from "@/components/shared/Language.vue"
import CustomModal from '@/components/shared/Modal.vue'
import SignUpForm from '@/components/shared/forms/SignUpForm.vue'

export default {
  name: "login",
  layout: "auth",
  components: {
    InputText,
    Password,
    PrimeButton: Button,
    // Language,
    CustomModal,
    SignUpForm,
  },
  data() {
    return {
      loginData: {
        dni: "",
        contrasena: "",
      },
      users: [],
      invalidCredentials: false,
      error: false,
      noCredentials: false,
    }
  },
  mounted() {
    // this finish the loadder
    this.$showLoader(false)
    this.$axios.setHeader("Accept-Language", this.$i18n.locale)
  },
  methods: {
    async login() {
      this.noCredentials = false
      this.error = false
      this.invalidCredentials = false
      if (this.loginData.dni === "" || this.loginData.contrasena === "") {
        this.noCredentials = true
      } else {
        try {
          this.$nextTick(() => {
            // start the loadder
            this.$nuxt.$loading.start()
          })
          await 
            this.$auth
            .loginWith("local", {
              // start login logic
              data: this.loginData,
            })
            .then((response) => {
              if (response.status === 200) {
                location.reload()
                this.$router.push('/') 
              }
            })

            // const response = await this.$axios.post('/api/usuarios/loggeo', this.loginData)
      
            // if (response.status === 200) {
            //   Redirigir a la página deseada después del login
            //   this.$router.push('/') 
            // }
        } catch (e) {
          console.log(e)
          if (e.response.data.data.errors.non_field_errors[0] === "Invalid credentials") {
            this.invalidCredentials = true
            // this finish the loadder
            this.$nextTick(() => {
              this.$nuxt.$loading.finish()
            })
          } else this.error = true
          } finally {
            this.$nextTick(() => {
              this.$nuxt.$loading.finish()
            })
        }
      }
    },
  },
}
</script>

<style lang="scss">
  body {
    font-family: "Karla", sans-serif;
    background-color: white;
    min-height: 100vh;
  }

  .brand-wrapper {
    margin-bottom: 5px;
    text-align: center;

    .logo {
      height: 130px;

      @media (max-width: 767px) {
        height: 100px;
      }
    }
  }

  .login-card {
    border: 0;
    border-radius: 27.5px;
    box-shadow: 0 10px 30px 0 rgba(172, 168, 168, 0.43);
    overflow: hidden;

    &-img {
      border-radius: 0;
      position: absolute;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .card-body {
      padding: 15px 60px 60px;

      @media (max-width: 422px) {
        padding: 35px 24px;
      }
    }

    &-description {
      font-size: 25px;
      color: #000;
      font-weight: normal;
      margin-bottom: 23px;
    }

    form {
      max-width: 326px;
    }

    .form-control {
      border: 1px solid #d5dae2;
      padding: 15px 25px;
      margin-bottom: 20px;
      min-height: 45px;
      font-size: 13px;
      line-height: 15;
      font-weight: normal;

      &::placeholder {
        color: #919aa3;
      }
    }

    .login-btn {
      padding: 13px 20px 12px;
      background-color: #000;
      border-radius: 4px;
      font-size: 17px;
      font-weight: bold;
      line-height: 20px;
      color: #fff;
      margin-bottom: 24px;

      &:hover {
        border: 1px solid #000;
        background-color: transparent;
        color: #000;
      }
    }

    .forgot-password-link {
      font-size: 14px;
      color: #919aa3;
      margin-bottom: 12px;
    }

    &-footer-text {
      font-size: 16px;
      color: #0d2366;
      margin-bottom: 60px;

      @media (max-width: 767px) {
        margin-bottom: 24px;
      }
    }

    &-footer-nav {
      text-align: center;
      margin-top: 50px;

      a {
        font-size: 14px;
        color: #919aa3;
      }
    }
  }

  .container,
  .container-sm,
  .container-md,
  .container-lg {
    max-width: 950px;
  }

.loginContainer {
  height: 100vh;
  background: rgba($color: #050e1f, $alpha:0.7);
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;

  &__main {
    width: 40rem;
    height: 60%;
    border: 2rem;
    background-color: white;
    box-shadow:0px 0px 14px #050e1f;
    border-radius: 20px;
    padding: 50px;
  }

  .main {
    &__signIn {
      width: 100%;
      display: flex;
      justify-content: center;
      font-size: 20px;
      
      .signIn__text {
        width: fit-content;
      }
    }

    &__group {
      width: 20rem;
      margin: auto;
      margin-bottom: 20px;

      .group {
        &__input {
          width: 100%;
          border: 1px solid #ccc !important;
          font-size: 0.8rem;
          
          &::placeholder, .p-password-input::placeholder {
            color: #ccc !important;
          }

          .p-password-input {
            width: 100% !important;
          }
        }

        &__login {
          background: #fb292a !important;
          border: 1px solid #fb292a !important;
        }

        &__register {
          color: #000 !important;
          display: block;
          text-align: center;
          text-decoration: none;

          &:hover {
            color: rgba($color: #a80e0e, $alpha: 0.7) !important;;
          }
        }
      }

    }

    &__container-img {
      width: 10rem;
      height: 10rem;
      background: rgba($color: #050e1f, $alpha:0.7);
      padding: 0.5rem;
      // margin-top: 7rem;
      // margin-bottom: 2rem;
      border-radius: 13rem;
      margin: 2rem auto !important; 
    }

    &__img {
      width: 100%;
      height: 100%;
      border-radius: 13rem;
    }
  } 
}








</style>
