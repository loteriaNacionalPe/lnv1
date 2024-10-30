<template>
  <div class="table-responsive mx-auto mb-2" :style="'width:' + tableWidth + '%'">
    <h4 v-if="registers.length==0" class="text-center">{{ $t('app').noRecords }}</h4>
    <table v-if="registers.length>0" class="table table-sm table-hover table-bordered">
      <thead class="table-light">
        <tr class="table-bordered">
          <th class="text-center align-middle border" :style="'width:10%'" scope="col">#</th>
          <th class="text-center align-middle border" v-for="col in cols" scope="col" :key="$generateKey(5) + col.title">{{ col.title }}</th>
          <th class="text-center align-middle border" :style="'width:15%'" v-if="hasOptions" scope="col">{{ $t('app').options }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="register, index in registers" :key="index" @dblclick="$emit('doubleClick',register, level)">
          <th class="text-center align-middle" scope="row">{{ (currentPage - 1) * perPage + index + 1 }}</th>
          <template v-for="col in cols" >
            <td v-if="Array.isArray(getPropertyValue(register,col.label))" class="text-center align-middle" :key="$generateKey(10) + col.label">
              <template v-for="item, i in getPropertyValue(register,col.label)" >
                <Tag  :value="item.name" class="mr-1 mt-1" :key="$generateKey(4) + i"  />
                <br v-if="((i+1)%6)==0" :key="$generateKey(4) + i"  >
              </template>
            </td>
            <td v-else-if="'boolean' === typeof(getPropertyValue(register,col.label))" class="text-center align-middle" :key="$generateKey(10) + col.label">
                <Tag :value="getPropertyValue(register,col.label)" :severity="getPropertyValue(register,col.label)? 'success': 'info'" class="mr-1 mt-1"   />
            </td>
            <td v-else class="text-center align-middle" :key="$generateKey(10) + col.label">{{ getPropertyValue(register,col.label)}}</td>

          </template>
          <td v-if="hasOptions" class="align-middle">
            <div class="mx-auto " style="width: fit-content;">
              <PrimeButton icon="fa-solid fa-pen-to-square" class="p-button-sm p-button-warning" @click="$emit('edit', register, level)" v-if="permissions.canEdit"/>
              <PrimeButton v-if="withDisableButton && permissions.canDelete" :icon="register.is_active?'fa-solid fa-user-slash':'fa-solid fa-user'" class="p-button-sm p-button-warning" @click="disabledEnabledObject(register)"/>
              <PrimeButton v-if="withDeleteButton && permissions.canDelete" icon="fa-solid fa-trash" class="p-button-sm p-button-danger" @click="deleteObject(register)"/>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <div v-if="registers.length>0 && paginate" class="mt-3">
      <nav class="d-sm-flex align-items-center justify-content-between">
        <div class="row justify-content-between  ml-0">
          <select class="custom-select custom-select-sm" v-model="perPage" @change="changePage(1)">
            <option disabled value="">N° {{ $t("app").rows }}</option>
            <option value="15">15 {{ $t("app").rows }}</option>
            <option value="20">20 {{ $t("app").rows }}</option>
            <option value="50">50 {{ $t("app").rows }}</option>
            <option value="100">100 {{ $t("app").rows }}</option>
          </select>
        </div>
        <div class="row justify-content-between  mr-0">
          <ul class="pagination justify-content-center m-0 pr-0">
            <li v-if="currentPage != 1" class="page-item">
              <a title="First page" class="page-link" @click="changePage(1)">
                <i class="fas fa-step-backward"></i>
              </a>
            </li>
            <li v-if="paginate.previous" class="page-item">
              <a @click="changePage(paginate.previous)" title="Previous" class="page-link">
                <i class="fas fa-chevron-left"></i>
              </a>
            </li>
            <li v-for="page in pages" class="page-item" :class="page == currentPage ? 'active' : ''" :key="$generateKey(5) + page">
              <a class="page-link" @click="changePage(page)">{{ page }}</a>
            </li>
            <li v-if="paginate.next" class="page-item">
              <a @click="changePage(paginate.next)" title="Next" class="page-link">
                <i class="fas fa-chevron-right"></i>
              </a>
            </li>
            <li v-if="paginate.last_page != 1" class="page-item">
              <a title="Last page" class="page-link" @click="changePage(paginate.last_page)">
                <i class="fas fa-step-forward"></i>
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</template>
<script>
import PrimeButton from 'primevue/button'
import Tag from 'primevue/tag'

export default {
  components: {
    PrimeButton,
    Tag
  },
  props: {
    cols: { type: Array, require: true },
    registers: { type: Array, require: true },
    withOptions: { type: Boolean, default: true },
    paginate: {default: null},
    page:{type: Number, default: 1},
    page_size:{default: 15},
    level: { type: Number,  default: null }, // To build more tables, set level that will be activated
    withDisableButton:{type: Boolean, default: false},
    withDeleteButton:{type: Boolean, default: true},
    tableWidth: {type: String, default: "100"},
    permissions: {type:Object, required: true}
  },
  data(){
    return{
      perPage:15,
      pages:[],
      currentPage: 1,
      hasOptions: true
    }
  },
  mounted(){
    this.hasOptions = this.withOptions && (this.permissions.canEdit || this.permissions.canDelete)
    if (this.paginate) {
      this.currentPage = this.page
      this.perPage = this.page_size
      this.pages = this.$getPageNumbers(this.paginate, this.currentPage)
    }
  },
  methods:{
    deleteObject(register) {
      this.$confirmDialog(this.$t("app").confirmMessage, this.$t("app").confirmation, "delete", register, this.level)
    },
    disabledEnabledObject(register) {
      this.$confirmDialog(this.$t("app").confirmMessage, this.$t("app").confirmation, "disable", register, this.level)
    },
    changePage(page){
      this.currentPage = page == null ? this.currentPage : page
      this.$emit('changePage',{page: this.currentPage,
                              page_size: this.perPage})
    },
    // loops through each value entered in LABEL and gets the final object  value
    getPropertyValue(object, label){
      let value = object
      const labels = label.split('.')
      labels.forEach(la => {
        value = value[la]?value[la]:''
      })
      return value
    }
  }
}
</script>
