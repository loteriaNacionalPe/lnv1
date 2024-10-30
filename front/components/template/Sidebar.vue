<template>
  <div class="ev-sidebar opened">
    <div id="sidebar" class="navbar-nav sidebar accordion toggled">
      <div>
        <a href="" class="brand">
          <!-- <div class="brand-icon">
            <img src="/img/ico-dt-100.png" alt="" />
          </div> -->
          <div class="brand-text ml-2">
            <h5>Loteria Nacional</h5>
          </div>
        </a>
      </div>
      <div class="py-1 sidebar__group">
        <ul class="sidebar__group__items">
          <li class="sidebar__group__item">
            <a href="/"  class="sidebar__group__item__content">
              <span>
                <i class="fas fa-fw fa-tachometer-alt"></i>
              </span>
              <span class="ml-2 text-item">Dashboard</span>
            </a>
          </li>
          <!-- Menu Loteria -->
          <BodyTemplate :elements="$t('sidebar').donwtimesSection" :expanded="expanded" />
          <!-- Menu Admin -->
          <BodyTemplate :elements="$t('sidebar').adminSection" :expanded="expanded"/>

        </ul>
      </div>
      <div class="text-center d-md-inlin switchMode">
        <InputSwitch :class="darkMode? 'switch-dark': 'switch-light'" v-model="darkMode" @change="changeMode"/>
      </div>
      <div class="text-center d-md-inlin" v-if="isSuperUser">
        <PrimeButton icon="fas fa-cogs" class="p-button-sm p-button-rounded p-button-secondary p-button-text" @click="goToSettings"/>
      </div>
      <div class="text-center d-md-inlin">
        <button type="button" id="sidebarToggle" class="border-0 sidebar__toggleButton mb-0" @click="toggleSidebar()" style="background-color: transparent;"></button>
      </div>
    </div>
  </div>
</template>
<script>

import PrimeButton from 'primevue/button'
import InputSwitch from 'primevue/inputswitch'
import BodyTemplate from "@/components/template/sidebar/Body.vue"
import { localStorageFunctions} from '~/store/localStorage'

export default {
  components: {
    BodyTemplate,
    PrimeButton,
    InputSwitch,
  },
  data(){
    return{
      expanded: false,
      isSuperUser: false,
      darkMode: false,
    }
  },
  created(){
    const user = this.$auth.user
    if(user.is_superuser){
      this.isSuperUser = true
    }
    if(localStorageFunctions.getItem("theme") === "dark"){
      this.darkMode = true
    }
  },
  methods: {
    toggleSidebar() {
      const evSidebar = document.querySelector(".ev-sidebar")
      evSidebar?.classList.toggle("opened")
      const sidebar = document.querySelector(".sidebar")
      sidebar?.classList.toggle("toggled")
      this.expanded = !this.expanded
    },
    goToSettings(){
      window.location.href = '/config/initial'
    },
    changeMode(){
      const content = document.getElementsByTagName("HTML")[0]
      if(this.darkMode){
        localStorageFunctions.setItem("theme", "dark")
        content.classList.add("theme--dark")
      } else {
        localStorageFunctions.setItem("theme", "light")
        content.classList.remove("theme--dark")
      }
    }
  },
}
</script>

<style lang="scss">
.switchMode {
  .switch{
    &-dark {
      .p-inputswitch {
        &-slider:before {
          background: #ffffff;
          font-family: 'Font Awesome 6 Free';
          content: "\f186";
          text-align: center;
          font-size: 0.8rem;
          font-weight: 600;
        }
      }
    }

    &-light {
      .p-inputswitch {
        &-slider:before {
          background: #ffffff;
          font-family: 'Font Awesome 6 Free';
          content: "\f185";
          text-align: center;
          font-size: 0.8rem;
        }
      }
    }
  }
}
</style>