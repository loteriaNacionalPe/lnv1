<template>
  <div>
    <template v-if="registers.length==0">
      <InputFile acceptedFiles=".xlsx" @change="setFile" icon="fa-sharp fa-solid fa-file-excel"/>
      <hr>
      <SaveCancelButton @save="saveFile" />
    </template>
    <div class="table-responsive">
      <table v-if="registers.length>0" class="table table-sm table-hover">
        <thead class="table-light">
          <tr>
            <th class="text-center" v-for="col in cols" scope="col" :key="$generateKey(4)+col">{{ col }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="register, index in registers"  :key="$generateKey(4)+index">
              <td  class="text-center" v-for="col in cols" :key="$generateKey(4) + col">
                <template v-if="col=='errors'">
                  <Tag v-for="error, key in register[col]" :value="register[col][key][0]" :key="$generateKey(4) + error" class="mb-1" severity="warning"/>
                </template>
                <template v-else-if="col=='was_created'">
                  <Tag :severity="getSeverity(register[col])" :value="getWasCreated(register[col])" />
                </template>
                <template v-else-if="col=='role_exists'">

                  <Tag v-if="register[col]==false"  severity="danger" :value="$t('security.role').dontRoleExist" />
                </template>
                <template v-else>
                  {{ register[col]}}
                </template>
              </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
<script>
import SaveCancelButton from '../buttons/SaveCancel.vue'
import InputFile from '../inputs/File.vue'
import Tag from 'primevue/tag'
export default{
  components:{
    SaveCancelButton,
    InputFile,
    Tag
  },
  props:{
    url:{type: String, require: true},
    idModal:{type: String, default: null},
  },
  data(){
    return{
      file: null,
      registers:[],
      cols:[]
    }
  },
  methods:{
    setFile(file){
      this.file = file
    },
    saveFile(){
      this.$showLoader()
      let formData = new FormData()
      formData.append("file", this.file)
      this.$axios
        .$post(this.url, formData, { headers: { "Content-Type": "multipart/form-data" } })
        .then((response)=>{
          this.registers = response.data
          this.cols = []
          for (const key in this.registers[0]) {
            this.cols.push(key)
          }
        })
        .catch(() => {
            this.$makeToast("error", this.$t("app").error)
        })
        .finally(() => {
          this.$showLoader(false)
        })
    },
    getWasCreated(value){
      return value? this.$t('app').yes : this.$t('app').no
    },
    getSeverity(value){
      return value? 'success':'danger'
    }
  }
}
</script>
