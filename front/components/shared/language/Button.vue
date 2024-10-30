<template>
  <button class="dropdown-item d-flex align-items-center " @click="$emit('click')">
    <div class="mr-3">
      <div class="icon-circle">
        <img :src="flag" alt="" width="80%" />
      </div>
    </div>
    <div>
      <p class="my-auto">{{ label }}</p>
    </div>
  </button>
</template>
<script >
export default {
  props: {
    flag: { type: String, require: true },
    label: { type: String, require: true },
  },
}
</script>
