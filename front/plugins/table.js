//here we create global funtions for the project
export default (context, inject) => {
  inject("createColObject", createColObject) // create a global funtion
  inject("getPageNumbers", getPageNumbers) // create a global funtion
  inject("getDataToSearch", getDataToSearch) // create a global funtion
  // create an object for table component
  function createColObject(title, label){
    return {
      title: title,
      label: label
    }
  }
  // to create pagination array
  function getPageNumbers(paginate, currentPage) {
    let pages = []
    if (!paginate.last_page) {
      return pages
    } else {
      let from = currentPage - 3
      if (from < 1) {
        from = 1
      }
      let to = from + 3 * 2
      if (to >= paginate.last_page) {
        to = paginate.last_page
      }
      while (from <= to) {
        pages.push(from)
        from++
      }
      return pages
    }
  }
  //gets the data to search and paginate
  function getDataToSearch(data, dataSearch){
    dataSearch.search = data?.search? data.search: ""
    dataSearch.page = data?.page? data.page: 1
    dataSearch.page_size = data?.page_size? data.page_size: dataSearch.page_size
    return dataSearch
  }
}
