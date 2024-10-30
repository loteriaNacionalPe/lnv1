<template>
  <div class="row">
    <div class="col-md-6 mt-1">
      <div class="field">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="fa-solid fa-signature"></i>
          </span>
          <InputText class="p-inputtext-sm" :class="{ 'p-invalid': errors?.first_name }" :placeholder="$t('app').name"
            v-model="user.first_name" />
        </div>
        <small v-if="errors?.first_name" class="p-invalid">{{ errors?.first_name[0] }}</small>
      </div>
    </div>
    <div class="col-md-6 mt-1">
      <div class="field">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="fa-solid fa-signature"></i>
          </span>
          <InputText class="p-inputtext-sm" :class="{ 'p-invalid': errors?.last_name }"
            :placeholder="$t('user.profile').lastName" v-model="user.last_name" />
        </div>
        <small v-if="errors?.last_name" class="p-invalid">{{ errors?.last_name[0] }}</small>
      </div>
    </div>
    <div class="col-md-6 mt-1">
      <div class="field">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="fa-solid fa-envelope"></i>
          </span>
          <InputText class="p-inputtext-sm" :class="{ 'p-invalid': errors?.email }"
            :placeholder="$t('user.profile').email" v-model="user.email" />
        </div>
        <small v-if="errors?.email" class="p-invalid">{{ errors?.email[0] }}</small>
      </div>
    </div>
    <div class="col-md-6 mt-1">
      <div class="field">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="fa-solid fa-user"></i>
          </span>
          <InputText class="p-inputtext-sm" :class="{ 'p-invalid': errors?.username }" :placeholder="$t('app').username"
            v-model="user.username" />
        </div>
        <small v-if="errors?.username" class="p-invalid">{{ errors?.username[0] }}</small>
      </div>
    </div>
    <div class="col-md-6 mt-1">
      <div class="field">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="fa-solid fa-lock"></i>
          </span>
          <Password class="p-inputtext-sm" :class="{ 'p-invalid': errors?.password }" :placeholder="$t('app').password" v-model="user.password" toggleMask :feedback="false" @change="setChangePassword"/>
        </div>
        <small v-if="errors?.password" class="p-invalid">{{ errors?.password[0] }}</small>
      </div>
    </div>
    <div class="col-md-6 mt-1">
      <div class="field">
        <div class="p-inputgroup">
          <span class="p-inputgroup-addon">
            <i class="fa-solid fa-id-card-clip"></i>
          </span>
          <Dropdown :class="{ 'p-invalid': errors?.role }" v-model="group" :options="roles" optionLabel="name"
            :filter="true" :placeholder="$t('app.select', { item: $tc('security.role.role', 1) })" />
        </div>
        <small v-if="errors?.role" class="p-invalid">{{ errors?.role[0] }}</small>
      </div>
    </div>
    <hr />
    <SaveCancelButton @save="save" :showCancelButton="showCancelButton" @cancel="$closeModal(this.idModal)" />
  </div>
</template>
<script>
import InputText from 'primevue/inputtext'
import Dropdown from 'primevue/dropdown'
import Password from 'primevue/password'
import SaveCancelButton from '~/components/shared/buttons/SaveCancel.vue'
export default {
  components: {
    InputText,
    Dropdown,
    Password,
    SaveCancelButton,
  },
  props: {
    showCancelButton: { type: Boolean, required: false, default: false },
    idModal: { type: String, require: false, default: null },
    userId: { type: Number, default: 0 },
  },
  data() {
    return {
      errors: {},
      user: {},
      roles: [],
      group: {},
      changePassword:null
    }
  },
  mounted() {
    this.getUserData()
  },
  methods: {
    getUserData() {
      this.$showLoader()
      if (this.userId == 0) {
        this.user = {
          first_name: "",
          last_name: "",
          email: "",
          username: "",
          password: "",
          is_first_login: true,
          is_active: true,
        }
        this.getRoles()
        this.$showLoader(false)
      } else {
        this.$axios
          .$get("/users/" + this.userId + "/")
          .then((response) => {
              this.user = response.data
              this.$showLoader(false)
              this.getRoles()
              this.changePassword = false
          })
          .catch((e) => {
            if (e.response.data.data) {
              this.$makeToast("warn", e.response.data.data)
            } else {
              this.$makeToast("error", this.$t("app").error)
            }
            this.$showLoader(false)
          })
      }
    },
    getRoles() {
      this.$showLoader()
      this.$axios
        .$get('/groups/listwithoutpermissions/')
        .then((response) => {
          if (response.ok) {
            this.roles = response.data
            if (this.userId != 0) {
              this.group = this.roles.find(({ name }) => name == this.user.groups[0].name)
            }
            this.$showLoader(false)
          }
        })
        .catch(() => {
          this.$makeToast('error', this.$t('app').error)
          this.$showLoader(false)
        })
    },
    save() {
      if (this.$_.isEmpty(this.group)) {
        this.errors.role = [this.$t('app.empty', { item: this.$tc('security.role.role', 1) })]
        this.$showLoader(false)
        return
      }
      this.user.group = this.group
      this.user.full_name = this.user.first_name + ' ' + this.user.last_name
      if (this.userId == 0) {
        this.$showLoader()
        this.$axios
          .$post('/users/', this.user)
          .then((response) => {
            if (response.ok) {
              this.$showLoader(false)
              this.$makeToast('success', this.$t('app.created',{item: this.$tc('security.user.user',1)}))
              this.$emit('save')
              this.$closeModal(this.idModal)
            }
          })
          .catch((e) => {
            if (e.response.data.data.errors) {
              this.errors = e.response.data.data.errors
            } else if (e.response.data.data) {
              this.$makeToast('warn', e.response.data.data)
            } else {
              this.$makeToast('error', this.$t('app').error)
            }
            this.$showLoader(false)
          })
      } else {
        if (this.changePassword) {
          this.$confirmDialog(this.$t('security.user.confirChangePassword'), this.$t('app.confirmation'))
        } else {
          this.update(false)
        }
      }
    },
    update(updatePassword) {
      this.$showLoader()
      let data = {
        user: this.user,
        updatePassword: updatePassword,
      }
      this.$axios
        .$put("/users/" + this.userId + "/", data)
        .then(() => {
            this.$showLoader(false)
            this.$emit("save")
            this.$makeToast("success", this.$t("app.updated", {item:this.$tc('security.user.user',1)}))
            this.$closeModal(this.idModal)
        })
        .catch((e) => {
          if (e.response.data.data.errors) {
            this.errors = e.response.data.data.errors
            this.closeConfirmation()
          } else if (e.response.data.data) {
            this.$makeToast("warn", e.response.data.data)
          } else {
            this.$makeToast("error", this.$t("app").error)
          }
          this.$showLoader(false)
        })
    },
    setChangePassword() {
      this.changePassword = this.user.password.length > 0 ? true : false
    },
  },
}
</script>
