import Vue from "vue"
import VueI18n from "vue-i18n"
// files to translate
import AppEs from "../assets/i18n/es/app.json"
import AppEn from "../assets/i18n/en/app.json"
import loginEs from "../assets/i18n/es/login.json"
import loginEn from "../assets/i18n/en/login.json"
import languageEs from "../assets/i18n/es/language.json"
import languageEn from "../assets/i18n/en/language.json"
import sidebarEs from "../assets/i18n/es/sidebar.json"
import sidebarEn from "../assets/i18n/en/sidebar.json"
import initialEs from "../assets/i18n/es/config/initial.json"
import initialEn from "../assets/i18n/en/config/initial.json"
import profileEs from "../assets/i18n/es/user/profile.json"
import profileEn from "../assets/i18n/en/user/profile.json"
import userEs from "../assets/i18n/es/security/user.json"
import userEn from "../assets/i18n/en/security/user.json"
import roleEs from "../assets/i18n/es/security/role.json"
import roleEn from "../assets/i18n/en/security/role.json"
import logEs from "../assets/i18n/es/security/log.json"
import logEn from "../assets/i18n/en/security/log.json"
import NotificationEn from "../assets/i18n/en/notifications/notifications.json"
import NotificationEs from "../assets/i18n/es/notifications/notifications.json"
// Tell Vue to use Vue I18n
Vue.use(VueI18n)

export default ({ app }) => {
  // Set the i18n instance on app
  // This way we can use it globally in our components through this.$i18n
  app.i18n = new VueI18n({
    // Set the initial locale
    locale: localStorage.getItem("lang") || "en",

    // Set the fallback locale in case the current locale can't be found
    fallbackLocale: "en",

    // Associate each locale to a content file
    messages: {
      en: {
        // Global variables
        app: AppEn,
        login: loginEn,
        language: languageEn,
        sidebar: sidebarEn,
        config:{
          initial:initialEn
        },
        user:{
          profile: profileEn
        },
        security: {
          user:userEn,
          role:roleEn,
          log:logEn
        },
        // Notifications
        notification: NotificationEn,
      },
      es: {
        // Global variables
        app: AppEs,
        login: loginEs,
        language: languageEs,
        sidebar: sidebarEs,
        config:{
          initial:initialEs
        },
        user:{
          profile: profileEs
        },
        security:{
          user:userEs,
          role:roleEs,
          log:logEs
        },
        // Notifications
        notification: NotificationEs,
      },
    },
  })
}
