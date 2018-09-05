require 'nats/client'
# [begin wildcard_tester]
NATS.start do |nc|
   nc.publish("time.us.east", '...')
   nc.publish("time.us.east.atlanta", '...')

   nc.publish("time.eu.east", '...')
   nc.publish("time.eu.east.warsaw", '...')

   nc.drain
end
# [end wildcard_tester]
