console.log "Nuclear launcher detected"

amqp = require 'amqp'
config = require './config'

connection = amqp.createConnection config.env

setup = (cb)->
  connection.on 'ready', ->
    resourceRequestExchange = connection.exchange "resource.request", config.exchanges["resource.request"], (exchange)->
      console.log "well done, we inject in resource.request"
    resourceReceiveExchange = connection.exchange "resource.recieve", config.exchanges["resource.recieve"], (exchange)->
      console.log "well done, we inject in resource.recieve"
    reousrceReleaseExchange = connection.exchange "resource.release", config.exchanges["resource.release"], (exchange)->
      console.log "well done, we inject in resource.release"
    cb resourceRequestExchange, resourceReceiveExchange, reousrceReleaseExchange


resourceRequestExchange = null
resourceReceiveExchange = null
reousrceReleaseExchange = null

setup (request, recieve, release)->
  resourceRequestExchange = request
  resourceReceiveExchange = recieve
  reousrceReleaseExchange = release






resourceListener = (resource)->
  console.log "running jobs"

resourceRelease = (resource)->
  console.log "release a resource"

resourcePool = ->
  resourcePool = [] 
  {
    pushPool: (resource)->
      resourcePool.push(resource)
    popPool: ->
      #TODO add pop a resource from list
      return {resource: "localhost"}
    removeFromPool: (resource)->
      return true
  }  
