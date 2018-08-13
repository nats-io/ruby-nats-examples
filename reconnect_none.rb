# [begin reconnect_none]
require 'nats/client'

NATS.start(servers: ["nats://127.0.0.1:1222", "nats://127.0.0.1:1223", "nats://127.0.0.1:1224"], reconnect: false) do |nc|
   # Do something with the connection

   # Close the connection
   nc.close
end
# [end reconnect_none]
