import _ from 'lodash'//to use lodash (global use)

//here we create global funtions for the project
export default (context, inject) => {
  inject("openModal", openModal) // create a global funtion
  inject("closeModal", closeModal) // create a global funtion
  inject("generateKey", generateKey) // create a global funtion
  inject("activeSideBar", activeSideBar) // create a global funtion
  inject("_", _) // to use Lodash
  inject("showLoader", showLoader) // import and use of Lodash
  inject("makeToast", makeToast) // create a global funtion
  inject("confirmDialog", confirmDialog) // create a global funtion
  inject("delay", delay) // create a global funtion
  inject("downloadTemplate", downloadTemplate) // create a global funtion
  inject("setPermissions", setPermissions) // create a global funtion
  inject("exportChartItems", exportChartItems) // create a global funtion
  inject("fontSizeGraphs", fontSizeGraphs) // create a global function

  // To open Modal
  function openModal(idModal) {
    this.$bvModal.show(idModal)
  }
  // To close Modal
  function closeModal(idModal) {
    if (idModal) this.$bvModal.hide(idModal)
  }
  //generate a random string with length 'num'
  function generateKey(num) {
    return Math.random().toString(36).substring(0, num)
  }
  //activate sidebar
  function activeSideBar(navId, itemId) {
    const nav = document.getElementById(navId)
    nav.classList.add("active-sidebarItem")
    // nav.style.backgroundColor = "rgb(228,228,228,0.6)" //transparent 0.6 of active-sidebarItem

    const listItems = document.getElementById(navId + "-items")
    if(listItems) {
      listItems.classList.add("show")
    }

    const item = document.getElementById(itemId)
    if(item != null){
      item.classList.add("active-sidebarItem")
    }
  }
  // show or hide the Loader
  function showLoader(loading= true){
    if(loading)
    {
      this.$nextTick(() => {
      this.$nuxt.$loading.start()
      })
    }else{
      this.$nextTick(() => {
        this.$nuxt.$loading.finish()
        })
    }
  }
  // create a toast
  function makeToast(variant = null, message = null) {
    // variant values: info, success, error, warn
    this.$toast.add({ severity: variant, summary: this.$t("app").headerToast, detail: message, life: 5000 })
  }
  //create a dialog to confirm o reject an acction
  function confirmDialog(message, title, emit = "confirm", data = null, op = null, attr = null) {
    this.$confirm.require({
      message: message,
      header: title,
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        if (emit) this.$emit(emit, data, op, attr)
      },
      reject: () => {
        if (emit) this.$emit("reject", data, op, attr)
      }
    })
  }
  //to delay invocation 'n' time in seconds
  function delay(n) {
    return new Promise(function (resolve) {
      setTimeout(resolve, n * 1000)
    })
  }
  function downloadTemplate(url){
    window.location.href = url
  }
  //to set permissions on pages
  function setPermissions(){
    let currentUserPermissions = {
      canEdit: false,
      canView: false,
      canCreate: false,
      canDelete: false,
    }
    let user = this.$auth.user
    if(!user.is_superuser){
      let page = document.location.href.split("/").slice(-1)[0].toLocaleLowerCase()
      switch (page) {
        case "role":
          page = "group" //permission codename
          break
        case "log":
          page = "logentry" //permission codename
          break
      }
      let permissions = user.groups[0].permissions.filter (({codename}) => codename.includes(page))
      if(permissions.length > 0){
        permissions.forEach(permission => {
          switch (permission.codename.split("_")[0]) {
            case "add":
              currentUserPermissions.canCreate = true
              break
            case "change":
              currentUserPermissions.canEdit = true
              break
            case "delete":
              currentUserPermissions.canDelete = true
              break
            case "view":
              currentUserPermissions.canView = true
              break
          }
        })
      }
    } else{
      currentUserPermissions.canCreate = true
      currentUserPermissions.canEdit = true
      currentUserPermissions.canDelete = true
      currentUserPermissions.canView = true
    }
    return currentUserPermissions  
  }

  // Export items for charts (amcharts)
  function exportChartItems() {
    return [
      {
        label: "...",
        menu: [
          {
            label: "Image",
            menu: [
              { type: "png", label: "PNG" },
              { type: "jpg", label: "JPG" },
              { type: "svg", label: "SVG" },
              { type: "pdf", label: "PDF" },
            ],
          },
          {
            label: "Data",
            menu: [{ type: "xlsx", label: "XLSX" }],
          },
          {
            label: "Print",
            type: "print",
          },
        ],
      },
    ]
  }
  
  // fontSize for charts
  function fontSizeGraphs() {
    return 11
  }
}
