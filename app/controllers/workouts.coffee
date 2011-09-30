Spine   = require('spine')
{Panel} = require('spine.mobile')

Workout = require('models/workout')
WorkoutType = require('models/workout_type')

class WorkoutsCreate extends Panel
  title: 'Add Workout'
  
  className: 'workouts create'
  
  events:
    'submit form': 'create'
  
  elements:
    'form': 'form'
  
  constructor: ->
    super
    @addButton('Back', @back)
    @addButton('Create', -> @form.submit()).addClass('right')
    @active -> @render()

  render: ->
    types = WorkoutType.all()
    @html require('views/workouts/form')
            types: types, 
            today: new Date
    
  create: (e) ->
    e.preventDefault()
    data = @form.serializeForm()
    item = new Workout(data)
    if item.save()
      @back()
    else
      @delay ->
        alert(item.validate().capitalize())
    
  back: ->
    @form.blur()
    @navigate('/workouts', trans: 'left')

class WorkoutsList extends Panel
  title: 'Workouts'
  
  className: 'workouts list'
  
  constructor: ->
    super
    @addButton('Add', @add).addClass('right')
    Workout.bind('refresh change', @render)
    
  render: =>
    workouts = Workout.all().reverse()
    @html require('views/workouts')(workouts)
    
  add: ->
    @navigate('/workouts/create', trans: 'right')

class Workouts extends Spine.Controller
  constructor: ->
    super
    @list = new WorkoutsList
    @create = new WorkoutsCreate
    
    @routes
      '/workouts': (params) -> @list.active(params)
      '/workouts/create': (params) -> @create.active(params)
      
    Workout.fetch()
    
module.exports = Workouts