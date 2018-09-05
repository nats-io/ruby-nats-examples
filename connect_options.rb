# [begin connect_options]
require 'nats/client'

timer = EM.add_timer(5) do
  NATS.connect do |nc|
    # Do something with the connection

    # Close the connection
    nc.close
  end
end
EM.cancel_timer(timer)
# [end connect_options]

