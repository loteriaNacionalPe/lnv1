<template>
 <!-- Nav Item - Language -->
 <li class="nav-item dropdown no-arrow mx-1">
    <a class="nav-link dropdown-toggle" id="alertsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
      <i class="fas fa-globe"></i>
    </a>
    <!-- Dropdown - Language -->
    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow header__sub-items" aria-labelledby="alertsDropdown">
      <h6 class="dropdown-header">{{ $t("language").title }}</h6>
      <LanguageButton v-for="lang, index in languages" :flag="lang.flag" :label="lang.label" :class="language == lang.language ? 'header__sub-items-selected' : 'header__sub-items-unselected'" @click="changeLanguage(lang.language)" :key="'lang-' + index" />
    </div>
  </li>
</template>

<script>
import LanguageButton from './language/Button.vue'
export default {
  name: "Language",
  components: {
    LanguageButton
  },
  data() {
    return {
      language: true,
      languages: [],
    }
  },
  created() {
    this.getLanguages()
  },
  mounted() {
    this.setLanguage()
  },
  methods: {
    getLanguages() {
      this.languages = [
        {
          flag: '/img/flag/usa_flag.png',
          language: 'en',
          label: this.$t("language").english
        },
        {
          flag: '/img/flag/spain_flag.png',
          language: 'es',
          label: this.$t("language").spanish
        }
      ]
    },
    changeLanguage(_lang) {
      localStorage.setItem("lang", _lang)
      location.reload()
    },
    setLanguage() {
      this.language = localStorage.getItem("lang") ? localStorage.getItem("lang") : 'en'
    },
  },
}
</script>
<style lang="scss">

</style>
