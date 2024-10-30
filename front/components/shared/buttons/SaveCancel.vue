<template>
  <div class="mx-auto " style="width: fit-content;">
    <PrimeButton icon="pi pi-check" :label="$t('app').save" class="p-button-sm" @click="$emit('save')" :disabled="disabledSaveButton"/>
    <PrimeButton v-if="showCancelButton" icon="pi pi-times" :label="$t('app').cancel" class="p-button-sm p-button-secondary" style="margin-left: .5em" @click="$emit('cancel')" />
  </div>
</template>
<script>
import PrimeButton from 'primevue/button'

export default {
  components:{
    PrimeButton
  },
  props: {
    showCancelButton: { type: Boolean, required: false, default: false },
    disabledSaveButton:{type: Boolean, default: false}
  },
}
</script>
