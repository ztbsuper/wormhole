module.exports = 
  env:
    host: 'localhost'
    port: 5672
    login: 'guest'
    password: 'guest'
    noDelay: true
    authMechanism: 'AMQPLAIN'
    connectionTimeout: 500
    vhost: '/'
  exchanges:
    "resource.request": 
      type: "fanout"
      confirm: true
    "resource.recieve":
      type: "fanout"
      confirm: true
    "resource.release":
      type: "fanout"
      confirm: true