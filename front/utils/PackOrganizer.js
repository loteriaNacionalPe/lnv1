// utils/PackOrganizer.js
export default class PackOrganizer {
    constructor(packs) {
      this.packs = packs
    }
  
    organize() {
      const length = this.packs.length
      let rows = []
  
      if (length === 3) {
        rows = this.splitIntoRows([3]);
      } else if (length === 4) {
        rows = this.splitIntoRows([2, 2])
      } else if (length === 5) {
        rows = this.splitIntoRows([3, 2])
      } else if (length === 6) {
        rows = this.splitIntoRows([3, 3])
      } else if (length === 7) {
        rows = this.splitIntoRows([4, 3])
      } else if (length === 8) {
        rows = this.splitIntoRows([4, 4])
      } else {
        rows = [this.packs] // Default case, all in one row
      }
  
      return rows
    }
  
    splitIntoRows(sizes) {
      let index = 0
      return sizes.map(size => {
        const row = this.packs.slice(index, index + size)
        index += size
        return row
      })
    }
  }