import Vue from "vue"

import "popper.js"
import "bootstrap"
import ToastService from 'primevue/toastservice'
import ConfirmationService from 'primevue/confirmationservice'
import Tooltip from 'primevue/tooltip'

require("popper.js")
require("bootstrap")

// config Toast
Vue.use(ToastService)
Vue.use(ConfirmationService)
Vue.directive('tooltip', Tooltip)