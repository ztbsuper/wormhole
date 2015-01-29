# wormhole
虫洞计划


#时序
0. pub发送请求消息到Q: 谁能给我资源， fanout
1. 所有sub收到资源，能有空闲资源的给出回应： ip_xxxx 的可以提供资源
2. pub随机拿一个ip， 发送： ip_xxxxx.request: 要一个chrome 34版本的资源
3. sub在启动时会版定到exchangeType= topic 的 ip_xxxx.*消息，收到以后产生资源
4. sub推送到resources资源上： {resource:"ip:port", from:"ip_xxxx"}
5. pub拿到resource， 进行job
6. pub job结束后， 推送这个资源到ip_xxxx的resource pool消息队列上， 对应客户端获取后删除资源实例

xxxx为ip16进制编码
