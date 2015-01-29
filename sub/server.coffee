console.log "Nuclear launcher detected"

amqp = require 'amqp'
config = require './config'

connection = amqp.createConnection config.env

connection.on 'ready',->
  console.log "get ready"
  resourceRequestExchange = connection.exchange 'resource.request', {type: 'fanout', confirm: true}
  connection.queue 'resource.request.queue', (q)->
    q.bind resourceRequestExchange, ''
    q.subscribe (message, headers, deliveryInfo, messageObject)->
      console.log message


resourceGenerator  = (request)->
  return {resource: "localhost:1000"};

releaseListenr = (resource)->
  console.log "resource release"


