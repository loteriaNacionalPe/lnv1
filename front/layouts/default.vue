<template>
  <client-only>
    <div id="wrapper">
      <Sidebar style="height:100vh"/>
      <div id="content-wrapper" class="scroll">
        <div id="content" style="height: 100vh;" class="d-flex flex-column">
          <div class="d-flex align-items-center">
            <div :style="isEventsPage? 'width:92%': ''" class="header__slot"></div>
            <CustomHeader style="z-index:2" :style="isEventsPage? 'width:8%': 'width:100%'"/>
          </div>
          <div class="container-fluid p-0" style="height: 89vh">
              <div class="row h-100">
                <nuxt class="col-12 h-100 pt-1 pl-4"  style="overflow-y: scroll;padding-right: 0.5rem;"/>
                <Toast :baseZIndex="99999" position="bottom-right" />
                <ConfirmDialog />
              </div>
          </div>
          <CustomFooter style="height: 5vh;"/> 
        </div>
      </div>
    </div>
  </client-only>
</template>
<script >
// import Sidebar from "~/components/template/Sidebar.vue"
import Toast from "primevue/toast"
import ConfirmDialog from 'primevue/confirmdialog'
import CustomHeader from "~/components/template/Header.vue"
import CustomFooter from "~/components/template/CustomFooter.vue"
import { localStorageFunctions} from '~/store/localStorage'


export default {
  components: {
    // Sidebar,
    CustomHeader,
    Toast,
    ConfirmDialog,
    CustomFooter
  },
  computed: {
    isEventsPage: function() {
      return this.$route.fullPath === '/event_management/events' || this.$route.fullPath === '/reports/breakdownAnalysis' || this.$route.fullPath === '/reports/crushingDetentionsReport'
    }
  },
  beforeMount(){
    // validate if it's the first login of the user
    if(this.$auth.user.is_first_login)
      window.location.href = '/user/changepassword'
    const content = document.getElementsByTagName("HTML")[0]
    content.classList.add("theme")
    
    if(localStorageFunctions.getItem("theme") === "dark"){
      content.classList.add("theme--dark")
    } else {
      content.classList.remove("theme--dark")
    }
  },
  mounted() {
    // finish the loadder
    this.$showLoader(false)
  },
}
</script>
<style>
body{
  font-size: 13px;
}
.container-fluid{
  padding-left: 0.5rem;
  padding-right: 0.5rem;
}
</style>
