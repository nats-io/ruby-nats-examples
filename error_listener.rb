# [begin error_listener]
require 'nats/client'

NATS.start(servers:["nats://demo.nats.io:4222"]) do |nc|
   nc.on_error do |e|
    puts "Error: #{e}"
  end

  nc.close
end
# [end error_listener]
