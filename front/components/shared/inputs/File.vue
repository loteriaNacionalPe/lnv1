<template>
  <div class="input-group input-group-sm mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text"><i :class="icon"></i></span>
    </div>
    <div class="custom-file">
      <input id="file" ref="inputFile" type="file" class="custom-file-input" accept="acceptedFiles" @change="onFileSelected">
      <label class="custom-file-label" @click="$refs.inputFile.click()">{{ filename || $t('app').chooseFile }}</label>
    </div>
  </div>
</template>
<script>
export default{
  props:{
    acceptedFiles:{type: String, require: true},
    icon:{type: String, require: true}
  },
  data(){
    return{
      file: null,
      filename: null
    }
  },
  methods:{
    onFileSelected(event) {
      this.file = event.target.files[0]
      this.filename = this.file ? this.file.name : null
      this.$emit('change', this.file)
    },
  }
}
</script>
