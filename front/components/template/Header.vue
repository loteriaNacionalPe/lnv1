<template>
  <div class="topbar-content shadow align-self-end d-flex align-items-center py-0 pl-0" style="box-shadow:0 6rem 11.75rem 0 rgba(58, 59, 69, 0.15) !important">
    <div class="text-header">
      <!-- <i class="fas fa-th"></i>
      <h4>Dashboard</h4> -->
    </div>
    <div class="d-flex">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item header-item">
          <!-- Nav Item - Notifications -->
          <!-- <Notification /> -->
        </li>
        <li class="nav-item header-item">
          <!-- Nav Item - Language -->
          <Language />
        </li>
        <li class="nav-item dropdown no-arrow mx-1 header-item">
          <!-- Nav Item - Profile -->
          <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="pi pi-user"></i>
          </a>
          <div class="dropdown-list dropdown-menu dropdown-menu-right shadow header__sub-items"
            aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header text-center">{{ $auth.user.full_name }}</h6>
            <hr>
            <PrimeButton icon="pi pi-user" :label="$t('app').profile" class="p-button-sm w-100 px-8" @click="goToProfile"/>
            <hr>
            <PrimeButton :label="$t('login').logout" class="p-button-sm w-100" @click="logout"  />
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import Language from "@/components/shared/Language.vue"
import PrimeButton from 'primevue/button'
// import Notification from "@/components/shared/Notification.vue"
export default {
  components: {
    PrimeButton,
    Language,
    // Notification,
  },
  methods: {
    logout() {
      this.$auth.logout().then(() => {
        location.reload(true)
      })
    },
    goToProfile(){
      window.location.href = '/user/profile'
    }
  }
}
</script>
