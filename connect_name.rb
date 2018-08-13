# [begin connect_name]
require 'nats/client'

NATS.start(servers:["nats://demo.nats.io:4222"], name: "my-connection") do |nc|
   nc.on_reconnect do
    puts "Got reconnected to #{nc.connected_server}"
  end

  nc.on_disconnect do |reason|
    puts "Got disconnected! #{reason}"
  end

  nc.close
end
# [end connect_name]
