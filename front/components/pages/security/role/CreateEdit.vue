<template>
  <div>
    <div class="field">
      <div class="p-inputgroup">
        <span class="p-inputgroup-addon">
          <i class="fa-solid fa-id-card-clip"></i>
        </span>
        <InputText class="p-inputtext-sm" :class="{ 'p-invalid': errors?.name }" :placeholder="$tc('security.role.role', 1)" v-model="role.name" />
      </div>
      <small v-if="errors?.name" class="p-invalid">{{ errors?.name[0]}}</small>
    </div>

    <hr class="my-3">
    <div class="row justify-content-between">
      <div class="col-auto mb-2">
        <h5>
          {{ $t('security.role').permissionsByModule }}
        </h5>
      </div>
      <div class="col-auto mb-2">
        <PrimeButton icon="pi pi-check" class="p-button-sm p-button-secondary" :label="$t('app').selectAll"  @click="selectAllPermissions" />
      </div>
    </div>
    <div class=" mt-1 table-responsive">
      <table class="table table-sm table-bordered">
        <thead>
          <tr class="text-center">
            <th>{{ $t("security.role").module }}</th>
            <th>{{ $t("security.role").moduleType }}</th>
            <th>{{ $t("security.role").permissions }}</th>
          </tr>
        </thead>
        <tbody>
          <template v-for="module in modules">
            <tr v-for="type, i in module.types" :key="$generateKey(5) + i">
              <td v-if="i === 0" class="align-middle" :rowspan="module.cantTypes">{{ $_.capitalize(module.name) }}</td>
              <td class="align-middle">{{ $_.capitalize(type.name) }}</td>
              <td>
                <div class="d-flex flex-wrap justify-content-between">
                  <div v-for="permission, index in type.permissions" class="my-2" :key="$generateKey(5) + index">
                    <div class="p-inputgroup">
                      <span class="p-inputgroup-addon">
                        <Checkbox :value="permission" v-model="role.permissions" />
                      </span>
                      <InputText :placeholder="permission.name" disabled />
                    </div>
                  </div>
                </div>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </div>
    <hr class="mb-2">
    <SaveCancelButton :showCancelButton="true" @save="saveRole" @cancel="$closeModal(idModal)" />
  </div>
</template>
<script>
import InputText from 'primevue/inputtext'
import PrimeButton from 'primevue/button'
import SaveCancelButton from '~/components/shared/buttons/SaveCancel.vue'
import Checkbox from 'primevue/checkbox'
export default {
  components: {
    InputText,
    PrimeButton,
    SaveCancelButton,
    Checkbox
  },
  props: {
    roleId: { type: Number },
    idModal :{ type: String, require: false, default: null }
  },
  data() {
    return {
      modules: null,
      role: [],
      errors:{}
    }
  },
  created() {
    this.getGroupModel()
  },
  methods: {
    getGroupModel() {
      this.$showLoader()
      this.$axios
        .$get("/groups/" + this.roleId + "/getmodel/")
        .then((response) => {
          if (response.ok) {
            this.role = response.data
            this.getModules()
          }
        })
        .catch((e) => {
          if (e.response.data.data) {
            this.$makeToast("warn", e.response.data.data)
          } else {
            this.$makeToast("error", this.$t("app").error)
          }
          this.$showLoader(false)
        })
    },
    getModules() {
      this.$showLoader() //show the loader
      this.$axios
        .$get("/contenttypes/")
        .then((response) => {
          this.modules = response.data
        })
        .catch(() => {
          this.$makeToast("error", this.$t("app").error)
        }).finally(() => {
          this.$showLoader(false) //hide the loader
        })
    },
    saveRole() {
      this.$showLoader()
      if (this.role.id == 0) {
        // new role
        this.$axios
          .$post("/groups/", this.role)
          .then(() => {
            this.$makeToast("success", this.$t("app.created",{item: this.$tc('security.role.role',1) }))
            this.$showLoader(false)
            this.$emit('save')
            this.$closeModal(this.idModal)
          })
          .catch((e) => {
            if (e.response.data.data) {
              this.errors = e.response.data.data.errors
            } else {
              this.$makeToast("error", this.$t("app").error)
            }
            this.$showLoader(false)
          })
      } else {
        // update role
        this.$axios
          .$put("/groups/" + this.role.id + "/", this.role)
          .then(() => {
            this.$makeToast("success", this.$t("app.edited",{item: this.$tc('security.role.role',1) }))
            this.$showLoader(false)
            this.$emit('save')
            this.$closeModal(this.idModal)
          })
          .catch((e) => {
            if (e.response.data.data) {
              this.errors = e.response.data.data.errors
            } else {
              this.$makeToast("error", this.$t("app").error)
            }
            this.$showLoader(false)
          })
      }
    },
    selectAllPermissions() {
      this.modules.forEach((module) =>
        module.types.forEach((type) =>
          type.permissions.forEach((permission) => {
            this.role.permissions.push(permission)
          })
        )
      )
    },
  }
}
</script>
