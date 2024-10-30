<template>
    <div>
    <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
      <div class="container">
        <div class="card login-card">
          <div class="row no-gutters">
            <div class="col-md-12">
              <ChangePassword :checkPassword="false"/>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>
<script>
import ChangePassword from '~/components/pages/security/users/ChangePassword.vue'

export default{
  layout: 'auth',
  components:{
    ChangePassword
  },
  mounted(){
    if(!this.$auth.user.is_first_login) window.location.href = '/'
    else this.$showLoader(false)
  },
}
</script>
<style lang="scss">
  body {
    font-family: "Karla", sans-serif;
    background-color: var(--primary);
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
      padding: 40px 20px;
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
    max-width: 500px;
  }
</style>
