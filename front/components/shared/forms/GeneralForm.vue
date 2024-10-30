<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <label for="name"> {{ $t('app').name }} </label>
        <div class="w-100">
          <div class="p-inputgroup">
            <span class="p-inputgroup-addon">
              <i class="pi pi-user"></i>
            </span>
            <InputText id="name" :class="{ 'p-invalid': errors?.name }" :placeholder="$t('app').name" v-model="generalObject.name" />
          </div>
          <small v-if="errors?.name" class="p-invalid">{{ errors?.name[0]}}</small>
        </div>
      </div>
      <!-- indicator section -->
      <div v-if="isIndicator" class="w-100 mt-3">
        <label for="formula">{{ $t('app').formula }}</label>
        <div>
          <TextArea id="formula" v-model="generalObject.formula" :placeholder="$t('app').formula" class="w-100" style="height: 3.5rem; resize: none;"/>
        </div>
      </div>
      <!-- indicator section end-->
      <!-- Description field-->
      <div class="w-100 mt-3">
        <label for="description">{{ $t('app').description }}</label>
        <div>
          <TextArea id="description" v-model="generalObject.description" :placeholder="$t('app').description" class="text-description"/>
        </div>
      </div>
      <!-- code field-->
      <div v-if="showCode" class="w-100 mt-3">
        <label for="description">{{ $tc('admin.imputations.code', 1) }}</label>
        <div>
          <InputText id="description" v-model="generalObject.code" :placeholder="$tc('admin.imputations.code', 1)" class="text-description"/>
        </div>
      </div>
      <!-- equipment section -->
      <template v-if="isEquipment">
        <div  class="w-100 mt-3">
          <label for="formula">Equipment Type</label>
          <div>
            <Dropdown v-model="generalObject.equipment_type" :options="equipmentsType" optionLabel="name" :filter="true" placeholder="Select a equipment Type" :showClear="true" class="w-100" :class="{ 'p-invalid': errors?.equipment_type }"/>
            <small v-if="errors?.equipment_type" class="p-invalid">{{ errors?.equipment_type[0]}}</small>
          </div>
        </div>
        <div  class="w-100 mt-3 d-flex align-items-center">
          <div class="mr-2">
            <label for="formula">{{ $t('admin.equipment.isCritical') }}</label>
          </div>
          <div class="switch-critical">
            <InputSwitch  v-model="generalObject.is_critical" />
          </div>
        </div>
        <div v-if="generalObject.is_critical" class="w-100 mt-3">
          <label for="formula">{{ $tc('admin.equipment.equipmentCauses',1) }}</label>
          <div>
            <MultiSelect v-model="generalObject.equipment_cause" :options="equipmentsCauses" optionLabel="name" :placeholder="$t('app.select', {item: $tc('admin.equipment.equipmentCauses',1)})" class="w-100" :filter="true"/>
          </div>
        </div>
      </template>
      <!-- equipment section end -->
      <div class="pb-4 w-100">
        <hr />
      </div>
      <div class="w-100">
        <SaveCancelButton @save="saveObject" :showCancelButton="true" @cancel="$closeModal(idModal)" />
      </div>
    </div>
  </div>
</template>
<script>
import InputText from 'primevue/inputtext'
import Textarea from 'primevue/textarea'
import SaveCancelButton from '~/components/shared/buttons/SaveCancel.vue'
import MultiSelect from 'primevue/multiselect'
import InputSwitch from 'primevue/inputswitch'
import Dropdown from 'primevue/dropdown'
import clone from 'just-clone'

export default {
  components: {
    InputText,
    TextArea: Textarea,
    SaveCancelButton,
    MultiSelect,
    InputSwitch,
    Dropdown
  },
  props: {
    object: { type: Object, require: true },
    url: { type: String, require: true },
    idModal: { type: String, default: null },
    table:{type:Object, require:true}
  },
  data() {
    return {
      generalObject: {},
      errors: null,
      equipmentsCauses:[],
      equipmentsType:[]
    }
  },
  computed: {
    isIndicator: function() {
      return this.url == "indicators"
    },
    isEquipment: function() {
      return this.url == "equipment"
    },
    showCode:function(){
      return this.$auth.user.is_superuser && 'code' in this.generalObject
    }

  },
  beforeMount() {
    this.generalObject = this.object
    if(this.isEquipment){
      this.getEquipmentsCauses()
      this.getEquipmentType()
    }
  },
  methods: {
    saveObject() {
      this.$showLoader()

      if(this.isEquipment){//modify the data to save or update
        let aux = []
        var equipment_causeAux =  clone(this.generalObject.equipment_cause)
        var equipment_typeAux =  clone(this.generalObject.equipment_type)
        this.generalObject.equipment_cause.forEach(element => {
          aux.push(element.id)
        })
        this.generalObject.equipment_cause = aux
        this.generalObject.equipment_type = this.generalObject.equipment_type.id
      }

      if (!this.generalObject?.id || this.generalObject.id == 0) {
        delete this.generalObject.id //delete id property from the object
        this.$axios
          .$post(`/${this.url}/`, this.generalObject)
          .then(() => {

            this.$closeModal(this.idModal)
            this.$makeToast("success", this.$t("app.created", {item: this.table.title}))
            this.$emit("save")

          })
          .catch((e) => {
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
      } else {
        this.$axios
          .$put(`/${this.url}/${this.generalObject.id}/`, this.generalObject)
          .then(() => {
            this.$closeModal(this.idModal)
            this.$makeToast("success", this.$t("app.updated",  {item: this.table.title}))
            this.$emit("save")
          })
          .catch((e) => {

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
      if(this.isEquipment){ //in case of error, we return the data to their started values
        this.generalObject.equipment_cause = equipment_causeAux
        this.generalObject.equipment_type = equipment_typeAux
      }
    },
    getEquipmentsCauses(){
      this.$showLoader()
      this.$axios
        .$get(`/${this.url}/getequipmentscauses/`)
        .then((response)=>{
          this.equipmentsCauses = response.data
          let update = []
          if (this.generalObject.equipment_cause)
            this.generalObject.equipment_cause.forEach(eq =>{
              let newE =  this.equipmentsCauses.find(e =>  e.id == eq.id)
              update.push(newE)
            })
          this.generalObject.equipment_cause = clone(update)
          this.$showLoader(false)
        })
    },
    getEquipmentType(){
      this.$showLoader()
      this.$axios
        .$get(`/equipmenttypes/`)
        .then((response)=>{
          this.equipmentsType = response.data
          this.$showLoader(false)
        })
    }
  },
}
</script>

<style lang="scss">
.text-description{
  width: 100%;
  height: 5rem;
  resize: none;
}
.switch-critical {
  .p-inputswitch{
      height: 1.6rem;
  }
  .p-inputswitch.p-inputswitch-checked .p-inputswitch-slider, 
  .p-inputswitch.p-inputswitch-checked .p-inputswitch-slider:hover{
    background: #607D8B; //$btn-bg-normal;
  }

  .p-inputswitch.p-focus .p-inputswitch-slider {
    box-shadow: none;
  }
}




</style>
