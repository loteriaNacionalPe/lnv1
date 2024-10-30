<template>
  <div>
    <PrimeCard>
      <template #title>
        <div class="row justify-content-between">
          <div class="col-auto card-title-size">
            {{ $t('app.list', { item: $tc('security.log.log', 2)})}}
          </div>
          <div class="col-auto d-flex">
            <Dropdown v-model="user" :options="listUsers" optionLabel="full_name" :filter="true" placeholder="Select User" class="mr-2"/>
            <Calendar id="range" v-model="dates" selectionMode="range" :manualInput="false" :dateFormat="$date.formatCalendar" class="mr-2"/>
            <PrimeButton icon="pi pi-search" class="p-button-sm p-button-secondary" @click="getLogs" />
          </div>
        </div>
      </template>
      <template #content>
        <CustomTable :permissions="permissions" v-if="showTable" :cols="cols" :registers="logsList" :paginate="paginate" :withOptions="false" @changePage="getLogs" :page="dataSearch.page" :page_size="dataSearch.page_size"/>
      </template>
    </PrimeCard>
  </div>
</template>
<script>
import PrimeCard from 'primevue/card'
import CustomTable from '~/components/shared/Table.vue'
import Calendar from 'primevue/calendar'
import PrimeButton from 'primevue/button'
import moment from "moment"
import Dropdown from 'primevue/dropdown'
export default {
  components: {
    PrimeCard,
    CustomTable,
    Calendar,
    PrimeButton,
    Dropdown
  },
  data() {
    return {
      showTable: false,
      cols: [
        this.$createColObject(this.$t('app').username, 'action_time'),
        this.$createColObject(this.$t('app').username, 'user.full_name'),
        this.$createColObject(this.$t('security.log').affectedObject, 'object_repr'),
        this.$createColObject(this.$t('app').username, 'change_message'),
      ],
      logList: [],
      listUsers: [],
      user: {
        id: 0,
        full_name: this.$t("app").all,
      },
      paginate: [],
      dataSearch: {
        search: "",
        page_size: 15,
        page: 1
      },
      dates: null,
      permissions: {}
    }
  },
  created() {
    this.permissions = this.$setPermissions()
    if(this.permissions.canView){
      this.dates = [new Date(moment().subtract(6, 'days').format()), new Date(moment().format())]
      this.getUsers()
    } else {
      this.$showLoader()
      document.location.href = "/"
    }
  },
  mounted() {
    this.$activeSideBar('side-security', 'logEntry')
  },
  methods: {
    getUsers() {
      this.$showLoader()
      this.$axios
        .$get("/users/listWithoutPaginate/")
        .then((response) => {
          this.listUsers.push({
            id: 0,
            full_name: this.$t("app").all,
          })
          response.data.forEach((user) => {
            this.listUsers.push(user)
          })
          this.$showLoader(false)
          this.getLogs()
        })
        .catch(() => {
          this.$makeToast("error", this.$t("app").error)
          this.$showLoader(false)
        })
    },
    getLogs(data) {
      this.$showLoader()
      this.showTable = false
      this.dataSearch = this.$getDataToSearch(data, this.dataSearch)
      let dataFilter = {
        id: this.user.id,
        startDate: this.$date.getFullDate(this.dates[0]),
        endDate: this.$date.getFullDate(this.dates[1]),
      }
      this.$axios
        .$post(`/logs/byrangetimeanduser/?page_size=${this.dataSearch.page_size}&page=${this.dataSearch.page}`, dataFilter)
        .then((response) => {
          this.logsList = response.data.results
          this.paginate = response.data.paginate
          this.logsList.forEach(log => {
            log.action_time = this.$date.convertStringToFormat(log.action_time, this.$date.formatFulldate)
          })
          this.showTable = true
          this.$showLoader(false)
        })
        .catch(() => {
          this.$makeToast("error", this.$t("app").error)
          this.$showLoader(false)
        })
    },
  }

}
</script>
