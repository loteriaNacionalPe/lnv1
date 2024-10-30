export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'Loteria Nacional',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' },
    ],
    link: [{ rel: "icon", type: "image/x-icon", href: "/" }],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/assets/template/css/styles.min.css',
    {src: "@assets/template/main.scss", mode: "client"},
    {src: "@assets/libs/fontawesome6/scss/fontawesome.scss", mode: "client"},
    {src: "@assets/libs/fontawesome6/scss/regular.scss", mode: "client"},
    {src: "@assets/libs/fontawesome6/scss/solid.scss", mode: "client"}
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    { src: "~/plugins/app.js", mode: "client" },
    { src: "~/plugins/i18n.js", mode: "client" },
    { src: "~/plugins/common.js", mode: "client" },
    { src: "~/plugins/date.js", mode: "client" },
    { src: "~/plugins/table.js", mode: "client" },
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // Doc: https://www.primefaces.org/primevue/showcase-v2/#/setup
    '@nuxtjs/axios',// library to make petitions
    '@nuxtjs/auth-next', // library to authentication
    '@nuxtjs/i18n', // library to translate
    'primevue/nuxt',// library of components
    "bootstrap-vue/nuxt",// library of components
  ],
  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    baseURL: "http://localhost:8001", // api url for local,
    withCredentials: false,
    // https: false
  },
  //to authentication
  auth: {
    redirect: {
      home: "/",
    },
    strategies: {
      local: {
        token: {
          property: "data.access_token",
          type: "Token",
          maxAge: 60 * 60 * 10,
          global: true,
          required: true,
        },
        user: {
          property: "data",
          autoFetch: false,
        },
        endpoints: {
          //login: { url: "/usuarios/", method: "get" },
          login: { url: "/api/usuarios/loggeo", method: "post" },
          user: { url: "/api/usuarios/detalles", method: "get" },
          logout: false,
        },
      },
    },
  },
  //to redited to login if no exist credentials
  router: {
    middleware: ['auth'],
  },
  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    // https://github.com/primefaces/primevue/issues/844
    transpile: ['primevue'],
    extend(config) {
      config.module.rules.push({
        test: /\.mjs$/,
        include: /node_modules/,
        type: 'javascript/auto',
      })
    },
  },
  //to tranlate pages
  i18n: {
    detectBrowserLanguage: {
      onlyOnRoot: true,
    },
  },
  //custom loader to review
  loading: "~/components/shared/Preloader.vue",
}
