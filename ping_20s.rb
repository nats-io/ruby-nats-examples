# [begin ping_20s]
require 'nats/client'

NATS.start(ping_interval: 20) do |nc|
   nc.on_reconnect do
    puts "Got reconnected to #{nc.connected_server}"
  end

  nc.on_disconnect do |reason|
    puts "Got disconnected! #{reason}"
  end

  # Do something with the connection
end
# [end ping_20s]
