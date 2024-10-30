<template>
  <div class="row justify-content-between">
    <div class="col-auto pl-0" :class="classTitle">
      {{title}}
    </div>
    <slot/>
    <div class="col-auto pr-0" style="display: -webkit-box;">
      <span class="p-input-icon-left">
        <i class="pi pi-search" />
        <InputText type="text" class="p-inputtext-sm" :placeholder="$t('app').search" v-model="search" @keyup="doSearch($event)" v-tooltip.bottom="$t('app.pressEnter')"/>
      </span>

      <PrimeButton icon="fa-regular fa-plus" class="p-button-sm p-button-primary ml-2" @click="$emit('click')" v-if="permissions.canCreate"/>
      <ul v-if="withOptions && permissions.canCreate" class="navbar-nav ml-auto">
        <li class="nav-item dropdown no-arrow ml-2">
          <a class="nav-link dropdown-toggle" id="alertsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-ellipsis-vertical"></i>
          </a>
          <!-- Dropdown - Language -->
          <div class="dropdown-list dropdown-menu dropdown-menu-right shadow" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header text-center">{{ $t("app").options }}</h6>
            <slot name="options"/>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import PrimeButton from 'primevue/button'
import InputText from 'primevue/inputtext'
export default{
  components:{
    PrimeButton,
    InputText
  },
  props:{
    title:{type: String, default: ''},
    classTitle:{type: String, default: ''},
    withOptions: {type: Boolean, default: false},
    option:{type: Number, required: false, default: 0},
    permissions: {type: Object, required: true}
  },
  data(){
    return{
      search: ''
    }
  },
  methods:{
    doSearch(e){
      if(e.key === 'Enter' || e.keyCode === 13 )
        this.$emit('change', {search:this.search}, this.option)
      else if (this.search.length==0)
        this.$emit('change', {search:this.search}, this.option)
    }
  }
}
</script>
