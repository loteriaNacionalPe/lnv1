export const localStorageVariables = {
  dataOrigin : 'dataOrigin',
  attributeTemplateList : 'attributeTemplateList',
  attributeTemplateToEvents : 'attributeTemplateToEvents',
}

export const localStorageFunctions = {
  getItem: (ItemName)=>{
    return localStorage.getItem(ItemName) ? JSON.parse(localStorage.getItem(ItemName)) : false
  },
  setItem:(ItemName, data)=>{
    localStorage.setItem(ItemName, JSON.stringify(data))
  },
  exist(ItemName){
    return localStorage.getItem(ItemName)? true : false
  }
}