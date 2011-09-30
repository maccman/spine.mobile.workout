Spine = require('spine')

class Workout extends Spine.Model
  @configure 'Workout', 'type', 'minutes', 'date'
  
  @extend Spine.Model.Local

  load: ->
    super
    @date = new Date(Date.parse(@date))
  
  validate: ->    
    return 'type required' unless @type
    return 'minutes required' unless @minutes
    return 'date required' unless @date
  
module.exports = Workout