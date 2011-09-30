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
    @addButton('Create', @create).addClass('right')
    @active -> @render()

  render: ->
    types = WorkoutType.all()
    @html require('views/workouts/form')
            types: types, 
            today: new Date
    
  create: (e) ->
    e.preventDefault()
    item = Workout.create(@formData())
    @back() if item
    
  back: ->
    @form.blur()
    @navigate('/workouts', trans: 'left')
    
  formData: ->
    type    = @form.find('[name=type]').val()
    minutes = parseInt(@form.find('[name=minutes]').val())
    date    = @form.find('[name=date]')[0].valueAsDate
    {type: type, minutes: minutes, date: date}

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