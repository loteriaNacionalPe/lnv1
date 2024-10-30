<template>
  <b-modal :id="id" :title="title" :dialog-class="fullScreen ? 'modal-fullscreen' : ''" :content-class="fullScreen ? 'modal-fullscreen' : ''" :size="size" hide-footer centered header-bg-variant="light" :scrollable="scroll" header-text-variant="secondary" :no-close-on-backdrop="backdropClose" @hidden="$emit('onHide')" :hide-header="hideHeader">
    <template #modal-header>
      <slot name="header"></slot>
    </template>
    <slot></slot>
  </b-modal>
</template>

<script>
export default {
  name: "Modal",
  props: {
    id: { type: String, required: true },
    title: { type: String },
    scroll: { type: Boolean, default: false },
    size: { type: String, validator: (value) => ["sm", "md", "lg", "xl"].indexOf(value) !== -1 },
    backdropClose: { type: Boolean, default: false },
    fullScreen: { type: Boolean, default: false },
    hideHeader: { type: Boolean, default: false },
  }
}
</script>
<style lang="scss">
.modal-fullscreen {
  width: 90%;
  height: 90%;
  margin: auto;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  position: fixed;
  z-index: 100000;
}
</style>
