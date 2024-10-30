<template>
  <PrimePanel header="Change password">
    <div class="p-fluid grid">
      <div v-if="checkPassword" class="col-12 mt-1">
        <div class="field">
          <div class="p-inputgroup">
            <span class="p-inputgroup-addon">
              <i class="fas fa-lock"></i>
            </span>
            <Password class="p-inputtext-sm" :class="{ 'p-invalid': errors?.password }" :placeholder="$t('app').password" toggleMask :feedback="false" v-model="data.password" @change="getCheckPassword"/>
          </div>
          <small v-if="errors?.password" class="p-invalid">{{ errors?.password[0]}}</small>
        </div>
      </div>
      <div class="col-12 mt-1">
        <div class="field">
          <div class="p-inputgroup">
            <span class="p-inputgroup-addon">
              <i class="fas fa-lock"></i>
            </span>
            <Password class="p-inputtext-sm" :class="{ 'p-invalid': errors?.new_password }" :placeholder="$t('app').newPassword" toggleMask  v-model="data.new_password" :disabled="disableInputs"/>
          </div>
          <small v-if="errors?.new_password" class="p-invalid">{{ errors?.new_password[0]}}</small>
        </div>
      </div>
      <div class="col-12 mt-1">
        <div class="field">
          <div class="p-inputgroup">
            <span class="p-inputgroup-addon">
              <i class="fas fa-lock"></i>
            </span>
            <Password class="p-inputtext-sm" :class="{ 'p-invalid': errors?.confirn_new_password }" :placeholder="$t('app').confirmPassword" toggleMask  v-model="data.confirn_new_password" :disabled="disableInputs"/>
          </div>
          <small v-if="errors?.confirn_new_password" class="p-invalid">{{ errors?.confirn_new_password[0]}}</small>
        </div>
      </div>
      <SaveCancelButton @save="updatePassword" class="mt-3"/>
    </div>
  </PrimePanel>
</template>
<script>
import PrimePanel from 'primevue/panel'
import SaveCancelButton from '~/components/shared/buttons/SaveCancel.vue'
import Password from 'primevue/password/Password'

export default {
  components: {
    PrimePanel,
    SaveCancelButton,
    Password
  },
  props:{
    checkPassword:{type: Boolean, default: true}
  },
  data(){
    return{
      data: {
        password: "",
        new_password: "",
        confirn_new_password: "",
      },
      disableInputs:true,
      errors:{},
      passwordChecked: false
    }
  },
  beforeMount(){
    this.disableInputs = this.checkPassword
  },
  methods:{
    updatePassword() {
      this.$showLoader()
      this.$axios
        .$post("/users/updatepassword/", this.data)
        .then(() => {
          this.$makeToast("success", this.$t("app.updated", {item:this.$t("app.password")}))
          this.cleanData()
          if (!this.checkPassword)
            window.location.href = '/'
        })
        .catch((e) => {
          if (e.response.data.data.errors) {
            this.errors = e.response.data.data.errors
          } else if (e.response.data.data) {
            this.$makeToast("warn", e.response.data.data)
          } else {
            this.$makeToast("error", this.$t("app").error)
          }
        }).finally(()=>{
          this.$showLoader(false)
        })
    },
    cleanData() {
      this.data.password = ""
      this.data.new_password = ""
      this.data.confirn_new_password = ""
      this.errors = []
      this.passwordChecked = false
    },
    getCheckPassword() {
      this.errors = []
      this.loader = true
      let data = {
        password: this.data.password,
      }
      this.$axios
        .$post("/users/checkpassword/", data)
        .then((response) => {
          if (response.ok) {
            this.passwordChecked = response.data
            if (this.passwordChecked == false) {
              this.errors.password = ["Incorrect Password"]
            }else{
              this.disableInputs = false
            }
          }
        })
        .catch((e) => {
          if (e.response.data.data) {
            this.$makeToast("warn", e.response.data.data)
          } else {
            this.$makeToast("error", this.$t("app").error)
          }
        })
    },
  }
}
</script>
