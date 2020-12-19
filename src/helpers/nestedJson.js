exports.nestedEngineer = (data) => {
  const result = data.reduce((data, item) => {
    if (data[item.ac_id]) {
      const group = data[item.ac_id]

      if (Array.isArray(group.sk_skill_name)) {
        group.sk_skill_name.push(item.sk_skill_name)
      } else {
        group.sk_skill_name = [group.sk_skill_name, item.sk_skill_name]
      }
    } else {
      data[item.ac_id] = item
    }

    return data
  }, {})

  const resultList = []
  Object.keys(result).forEach(function (acId) {
    resultList.push(result[acId])
  })

  return resultList
}
