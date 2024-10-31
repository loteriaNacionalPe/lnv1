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
    { src: "~/plugins/common.js", mode: "client" },
    { src: "~/plugins/date.js", mode: "client" },
    { src: "~/plugins/table.js", mode: "client" },
    { src: '~/plugins/axios.js', mode: "client" },
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
    'primevue/nuxt',// library of components
    "bootstrap-vue/nuxt",// library of components
  ],

  baseURL: "http://localhost:9000", // api url for local,
  withCredentials: false,
  // https: false
  //to authentication
  auth: {
    redirect: {
      home: "/",
    },
      strategies: {
        local: {
          token: {
            property: "access_token",
            type: "",
            maxAge: 60 * 60 * 10,
            global: true,
            required: true,
          },
          user: {
            property: "0",
            autoFetch: false,
          },
        endpoints: {
          //login: { url: "/usuarios/", method: "get" },
          login: { url: "http://localhost:9000/api/auth/login", method: "post" },
          user: { url: "http://localhost:9000/api/user/detalles", method: "get" },
          logout: false,
        },
      },
    },
  },
  //to redited to login if no exist credentials
  router: {
    middleware: ['auth'],
  },
  serverMiddleware: [
    '~/serverMiddleware/cors'
  ],
  axios: {
    proxyHeaders: false,
    credentials: false
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
  //custom loader to review
  loading: "~/components/shared/Preloader.vue",
}
