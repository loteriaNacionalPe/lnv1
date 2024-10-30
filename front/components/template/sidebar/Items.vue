<template>
  <div>
    <li class="sub-level__top-item" v-if="!expanded">
      <span class="title">{{ title }}</span>
    </li>
    <li v-for="item in items" :key="item.id" class="sidebar__group__item">
      <a class="sidebar__group__item__content text-item" :id="item.id" :href="item.url" :key="item.id" style="padding: 0.4rem 0.4rem;">
          {{ item.name }}
      </a>
    </li>
  </div>
</template>
<script>
export default {
  props: {
    permission: {
      type: String,
      default: "",
    },
    title: {
      type: String,
      default: "",
    },
    items: {
      type: Array(),
      default: "",
    },
    parent: {type:String},
    expanded: {type:Boolean, required: true}
  },
  data() {
    return {
      permissions: {},
      user: {},
    }
  }
}
</script>
