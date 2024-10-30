<template>
  <div>
    <PrimeCard>
      <template #title>
        <CustomTitle :permissions="permissions" :title="$t('app.list', {item: $tc('security.user.user',2)})" @click="openModal" @change="getUsers" classTitle="card-title-size" :withOptions="true" class="mx-auto" style="width:95%" >
          <template #options>
            <PrimeButton :label="$t('app.bulkLoad', {item: $tc('security.user.user',2)})" class="p-button-sm p-button-secondary p-button-text w-100" @click="$openModal('modal-bulkload-user')"/>
            <PrimeButton :label="$t('app').downloadTemplate" class="p-button-sm p-button-secondary p-button-text w-100 p-1" @click="$downloadTemplate('/files/formats/usersFormat.xlsx')"/>
          </template>
        </CustomTitle>
      </template>
      <template #content>
        <CustomTable v-if="showTable" :cols="cols" :registers="userList" :paginate="paginate" @changePage="getUsers" @edit="openModal" @disable="disableUser" :withDisableButton="true" :withDeleteButton="false" :page="dataSearch.page" :page_size="dataSearch.page_size" :permissions="permissions" tableWidth="95"/>
      </template>
    </PrimeCard>
    <CustomModal id="modal-editcreate-user" :title="title" size="lg">
      <CreateEditUser :showCancelButton="true" idModal="modal-editcreate-user" @save="getUsers" :userId="userId"/>
    </CustomModal>
    <CustomModal id="modal-bulkload-user" :title="$t('app.bulkLoad', {item: $tc('security.user.user',2)})" :scroll="true" size="lg" @onHide="getUsers">
      <UploadFileForm url="/users/bulkload/" idModal="modal-bulkload-user" />
    </CustomModal>
  </div>
</template>
<script>
import PrimeCard from 'primevue/card'
import CustomTable from '~/components/shared/Table.vue'
import CustomModal from '~/components/shared/Modal.vue'
import CreateEditUser from '~/components/pages/security/users/CreateEdit.vue'
import CustomTitle from '~/components/shared/Title.vue'
import PrimeButton from 'primevue/button'
import UploadFileForm from '~/components/shared/forms/UploadFile.vue'

export default {
  components: {
    PrimeCard,
    CustomTable,
    CustomModal,
    CreateEditUser,
    CustomTitle,
    PrimeButton,
    UploadFileForm
  },
  data() {
    return {
      cols:[
        this.$createColObject( this.$t('user.profile').fullName,'full_name'),
        this.$createColObject( this.$t('app').username,'username'),
        this.$createColObject( this.$t('user.profile').email ,'email'),
        this.$createColObject( this.$tc('security.role.role',1),'groups.0.name')
      ],
      userList: [],
      paginate:[],
      showTable: false,
      dataSearch:{
        search:"",
        page_size:15,
        page: 1
      },
      userId:null,
      title: "",
      permissions: {}
    }
  },
  created() {
    this.permissions = this.$setPermissions()
    if(this.permissions.canView){
      this.getUsers()
    } else {
      this.$showLoader()
      document.location.href = "/"
    }
  },  
  mounted(){
    this.$activeSideBar('side-security', 'users')
  },
  methods: {
    getUsers(data) {
      this.$showLoader()
      this.showTable = false
      this.dataSearch = this.$getDataToSearch(data, this.dataSearch)
      this.$axios.$get(`/users/?page_size=${this.dataSearch.page_size}&page=${this.dataSearch.page}&search=${this.dataSearch.search}`)
        .then((response) => {
          this.userList = response.data.results
          this.paginate = response.data.paginate
          this.showTable = true
          this.$showLoader(false)
        }).catch(()=>{
          this.$makeToast('error', this.$t('app').error)
        })
    },
    openModal(data){
      this.userId = data?.id? data.id : 0
      this.title = this.userId==0? this.$tc('app.new', 1,{item: this.$tc('security.user.user',1)}): this.$t('app.edit',{item: this.$tc('security.user.user',1)})
      this.$openModal('modal-editcreate-user')
    },
    disableUser(user) {
      this.$showLoader()
      user.is_active = !user.is_active
      this.$axios
        .$post(`/users/${user.id}/disableuser/`, user)
        .then(() => {
          this.$showLoader(false)
        })
        .catch((e) => {
          user.is_active = !user.is_active

          if (e.response.status == 400) {
            if (e.response.data.data.errors) {
              this.errors = e.response.data.data.errors
            } else if (e.response.data.data) {
              this.$makeToast("warn", e.response.data.data)
            }
          } else {
            this.$makeToast("error", this.$t("app").error)
          }
        })
        .finally(() => {
          this.$showLoader(false)
        })
    }
  }
}
</script>
