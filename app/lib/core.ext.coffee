String::capitalize = ->
  @charAt(0).toUpperCase() + @substring(1).toLowerCase()
  
Date::toDashString = ->
  year  = @getFullYear()
  month = @getMonth()
  day   = @getDate()

  month = "0#{month}" if month < 10
  day   = "0#{day}" if day < 10
  
  [year, month, day].join('-')