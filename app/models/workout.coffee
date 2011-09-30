Spine = require('spine')

class Workout extends Spine.Model
  @configure 'Workout', 'type', 'minutes', 'date'
  
  @extend Spine.Model.Local
    
  stringDate: (value) ->
    @date = Date.parseDashString(value)
    
  stringMinutes: (value) ->
    @minutes = parseFloat(value)
    
  load: ->
    super
    @date = new Date(Date.parse(@date))
  
  validate: ->    
    return 'type required' unless @type
    return 'minutes required' unless @minutes
  
module.exports = Workout