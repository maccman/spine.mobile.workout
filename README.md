##Spine Mobile Workout

Simple example application for [Spine Mobile](http://spinejs.com/mobile), allowing users to create and list workouts. 

![Workout](https://lh6.googleusercontent.com/-o_uvPNYFUUc/TobXzYHe4CI/AAAAAAAABa8/gzNnK6EGdmo/s640/Screen%252520Shot%2525202011-10-01%252520at%25252010.04.27.png)

##Usage

We need to install some npm modules, namely `spine.app` and `hem`. The former generates Spine apps, whilst the latter acts as a dependency manager. If you haven't got them installed already, you'll need to download [Node](http://nodejs.org) and [npm](http://npmjs.org). Then run:

    npm install -g hem spine.app
    
Now let's install the local npm dependencies, and start the [Hem](http://spinejs.com/docs/hem) server.
    
    cd spine.mobile.workout
    npm install .
    hem server
