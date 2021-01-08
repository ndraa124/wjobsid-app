module.exports = {
  formatDate: (date) => {
    return [date.getFullYear(), date.getMonth() + 1, date.getDate()].join('-') + ' ' +
            [date.getHours(), date.getMinutes(), date.getSeconds()].join(':')
  },

  getAbsoluteMonths: (momentDate) => {
    const months = Number(momentDate.format('MM'))
    const years = Number(momentDate.format('YYYY'))
    return months + (years * 12)
  }
}
