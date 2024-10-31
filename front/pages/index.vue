<template>
  <div>
    <CustomTable :cols="cols" :registers="registers" :permissions="permissions" @delete="deleteUser" @edit="editUser">
      
    </CustomTable>

    <CustomModal id="modal-editar" :withHeader="true" :hideHeader="false" title="Actualización de usuario" @onHide="$closeModal('modal-editar')" size="md">
      <SignUpForm :objUser="userToEdit"/>
    </CustomModal>
  </div>
</template>

<script>
import CustomTable from '~/components/shared/Table.vue'
import CustomModal from '@/components/shared/Modal.vue'
import SignUpForm from '@/components/shared/forms/SignUpForm.vue'
import { userAxios } from '~/plugins/axios'

export default {
  components: {
    CustomTable,
    CustomModal,
    SignUpForm,
  },
  data() {
    return {
      cols: [
          this.$createColObject('Nombres', 'nombres'),
          this.$createColObject('Apellidos', 'apellidos'),
          this.$createColObject('Celular', 'celular'),
          this.$createColObject('Email', 'email'),
        ], 
      registers: [],
      permissions: {'canEdit': true, 'canDelete': true},
      userToEdit: {},
    }
  },
  mounted() {
    this.searchUsers()
  },
  methods: {
    searchUsers() {
      userAxios.get('api/usuarios/')
      .then((response) => {
        this.registers = response
      })
      .catch(() => {
        this.$makeToast('error', 'error')
      })
    },
    deleteUser(user) {
      this.$axios.$delete(`/api/usuarios/eliminacionDeUsuario/${user.dni}`)
      .then((response) => {
        console.log(response)
        this.searchUsers()
      })
      .catch(() => {
        this.$makeToast("error", "Error")
        this.$showLoader(false)
      })
    },
    editUser(user) {
      this.userToEdit = user
      this.$openModal('modal-editar')
    }
  }
}
</script>
