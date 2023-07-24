const navStudioFilter = (minPrice, maxPrice, studioType, amenities) => {
  let conditionArr = []
  let whereClause = ''

  if (minPrice) {
    conditionArr.push(`s.price BETWEEN ${minPrice}`)
  }
  if (maxPrice) {
    conditionArr.push(`${maxPrice}`)
  }
  if (studioType) {
    conditionArr.push(`s.studio_type_id = ${studioType}`)
  }
  if (amenities) {
    conditionArr.push(`ao.id = ${amenities}`)
  }
  if (conditionArr.length > 0) {
    whereClause = 'WHERE' + ' ' + conditionArr.join(' AND ')
  }
  return whereClause
}

const ordering = (orderBy) => {
  switch (orderBy) {
    case 'priceAsc':
      return 'ORDER BY s.price ASC, s.id ASC'
    case 'priceDesc':
      return 'ORDER BY s.price DESC, s.id ASC'
    default:
      return 'ORDER BY s.id'
  }
}

export { navStudioFilter, ordering }
