<template>
  <div>
    <PrimeCard>
      <template #title>
        <CustomTitle :permissions="permissions" :title="$t('app.list', {item: $tc('security.role.role',2)})" @click="openModal" @change="getGroups" classTitle="card-title-size" style="width:95%" class="mx-auto"/>
      </template>
      <template #content>
        <CustomTable :permissions="permissions" v-if="showTable" :cols="cols" :registers="groupList" :paginate="paginate" @edit="openModal" @delete="deleteGroup" :page="dataSearch.page" :page_size="dataSearch.page_size" tableWidth="95"/>
      </template>
    </PrimeCard>
    <CustomModal id="modal-editcreate-group" :title="$tc('app.new', 1,{item: $tc('security.role.role',1)})" size="xl" :scroll="true">
      <CreateEditGroup :roleId="selectedRoleId" idModal="modal-editcreate-group" @save="getGroups"/>
    </CustomModal>
  </div>
</template>
<script>
import PrimeCard from 'primevue/card'
import CustomTitle from '~/components/shared/Title.vue'
import CustomTable from '~/components/shared/Table.vue'
import CustomModal from '~/components/shared/Modal.vue'
import CreateEditGroup from '~/components/pages/security/role/CreateEdit.vue'
export default{
  components:{
    PrimeCard,
    CustomTitle,
    CustomTable,
    CustomModal,
    CreateEditGroup
  },
  data(){
    return{
      showTable:false,
      groupList: [],
      paginate:[],
      cols:[
        this.$createColObject( this.$t('app').name,'name'),
        this.$createColObject( this.$t('security.role').permissionsNumber,'permissions.length'),
      ],
      selectedRoleId:0,
      dataSearch:{
        search:"",
        page_size:15,
        page: 1
      },
      permissions: {}
    }
  },
  created(){
    this.permissions = this.$setPermissions()
    if(this.permissions.canView){
      this.getGroups()
    } else {
      this.$showLoader()
      document.location.href = "/"
    }
  },
  mounted(){
    this.$activeSideBar('side-security', 'role')
  },
  methods:{
    getGroups(data){
      this.$showLoader()
      this.dataSearch = this.$getDataToSearch(data, this.dataSearch)
      this.$axios
        .$get(`/groups/?page_size=${this.dataSearch.page_size}&page=${this.dataSearch.page}&search=${this.dataSearch.search}`)
        .then((response) => {
          this.groupList = response.data.results
          this.paginate = response.data.paginate
          this.showTable=true
        }).catch(() => {
          this.$makeToast("error", this.$t("app").error)
        })
        .finally(()=>{
          this.$showLoader(false)
        })
    },
    openModal(role=null){
      this.selectedRoleId = role? role.id: 0
      this.$openModal('modal-editcreate-group')
    },
    deleteGroup(role) {
      this.$showLoader()
      this.$axios
        .$delete(`/groups/${role.id}/`, role)
        .then(() => {
          this.$showLoader(false)
          this.getGroups()
        })
        .catch(() => {
          this.$makeToast("error", this.$t("app").error)
          this.$showLoader(false)
        })
    }
  }
}
</script>
