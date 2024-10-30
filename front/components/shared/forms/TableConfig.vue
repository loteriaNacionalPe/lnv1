<template>
  <div  v-if="showImput" class="row">
    <div class=" col-auto">
        <label >{{$t('app').numberTables}}</label>
      </div>
    <div class=" col-8">
        <InputNumber v-model="quantityTables" :min="1" :max="10"  @onChange="generateArrayTable"/>
    </div>
    <hr>
    <h5>
      {{$t('app').tablesInfo}}
    </h5>
    <div v-for="(t, index) in configTables" class="field mb-1" :key="$generateKey(5) + index">
      <label class="mr-5"> {{ $t('app').tablesLevel + ' ' + t.level+ ':' }}</label>
      <InputText type="text" class="p-inputtext-sm w-75" v-model="t.title"  />
    </div>
    <hr>
    <SaveCancelButton @save="saveTableInfo"/>
  </div>
</template>
<script>
import InputText from 'primevue/inputtext'
import SaveCancelButton from '../buttons/SaveCancel.vue'
import InputNumber from '../inputs/Number.vue'
import clone from 'just-clone'
export default{
  components:{
    InputNumber,
    SaveCancelButton,
    InputText
  },
  props:{
    url:{type:String, require: true},
    idModal: { type: String, default: null }
  },
  data(){
    return{
      configTables:[],
      showImput:false,
      quantityTables: 0
    }
  },
  created(){
    this.getTableConfig()
  },
  methods:{
    generateArrayTable(){
      let aux = clone(this.configTables)
      this.configTables = []
      for (let i = 0; i < this.quantityTables; i++) {
        let object = { title: aux[i]?.title||null,
                      level: i+1}
          this.configTables[i] =  object
      }
    },
    saveTableInfo(){
      this.$showLoader()
      this.$axios
          .$post(`/${this.url}/savetablesconfig/`,this.configTables)
          .then(()=>{
            this.$closeModal(this.idModal)
          })
          .catch(() => {
              this.$makeToast("error", this.$t("app").error)
          }).finally(()=>{
            this.$showLoader(false)
          })
    },
    getTableConfig(){
      this.showImput = false
      this.$showLoader()
      this.$axios
        .$get(`/${this.url}/gettablesconfig/`)
        .then((response) => {
          this.configTables = response.data
          this.quantityTables = this.configTables.length
          this.generateArrayTable()
          this.showImput = true
          this.$showLoader(false)
        })
        .catch(() => {
          this.$makeToast("error", this.$t("app").error)
        })
    }
  }
}
</script>
