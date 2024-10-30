import moment from "moment"
import momenttz from "moment-timezone"

export default (context, inject) => {
  inject('date', date)
}
const formatMomentToDate = 'YYYY-MM-DD HH:mm:ss'
let date = {
  formatCalendar : "dd/mm/yy",// use to set format in the calendar component from prime vue
  formatFulldate : "DD/MM/YYYY HH:mm:ss",
  formatEventsDate : "YYYY-MM-DD HH:mm:ss",
  //recive a date of type 'Date', default separator is '/' and return a string in format 'd/m/yy'
  getDate: (date , separator='/')=>{
    return date.getDate() + separator + (date.getMonth()+1)+ separator+ date.getFullYear()
  },
  // return a date in format '1975-08-19T23:15:30.000Z', it needs a parameter type 'Date' to work
  getFullDate: (date )=>{
    return date.toJSON()
  },
  // recive an 'string' in any date format and return a new string in a specific 'format'
  convertStringToFormat:(string, format)=>{
    return string? moment(string).format(format): ''
  },
  //add date , date is an string , value is a number, rank is an string
  // rank accept: [ 
  //   'y' -> for year, 
  //   'Q' -> for quarters, 
  //   'M' -> for Monts, 
  //   'w' -> for weeks, 
  //   'd' -> for days,
  //   'h' -> for hours,
  //   'm' -> for minutes,
  //   's' -> for seconds,
  //   'ms' -> for miliseconds ]
  add(date, value, rank){
    let currentDate = moment(date)
    return new Date(currentDate.add(value, rank).format(formatMomentToDate))
  },
  // subtract date, date is an string , value is a number, rank is an string
  // rank accept: [ 
  //   'y' -> for year, 
  //   'Q' -> for quarters, 
  //   'M' -> for Monts, 
  //   'w' -> for weeks, 
  //   'd' -> for days,
  //   'h' -> for hours,
  //   'm' -> for minutes,
  //   's' -> for seconds,
  //   'ms' -> for miliseconds ]
  subtract(date, value, rank){
    let currentDate = moment(date)
    return new Date(currentDate.subtract(value, rank).format(formatMomentToDate))    
  },
  //create a new date with specifict format
  createDate(date, isToFilter =false){
    let newDate = null
    if (isToFilter) {
      newDate = moment().format(date)
    }else{
      newDate = moment(date).format(formatMomentToDate)
    }
    return new Date(newDate)
  },
  convertFromUTCtoUserZone(date){
    let time = moment.utc(date).tz(momenttz.tz.guess())
    return time.format(this.formatFulldate) == "Invalid date" ? "" : time.format(this.formatFulldate)
  },
  // convert a date to user time zone
  convertFromUserZoneToUTC(date, format = this.formatEventsDate){
    return moment(date).utc().format(format)
  }
}
