require('lib/setup')

Spine   = require('spine')
{Stage} = require('spine.mobile')
Workouts = require('controllers/workouts')

class App extends Stage.Global
  constructor: ->
    super
    
    new Workouts
    
    Spine.Route.setup(shim: true)
    @navigate '/workouts'

module.exports = App