# [begin subscribe_arrow]
require 'nats/client'
require 'fiber'

NATS.start(servers:["nats://127.0.0.1:4222"]) do |nc|
  Fiber.new do
    f = Fiber.current

    nc.subscribe("time.>") do |msg, reply|
      f.resume Time.now.to_f
    end

    nc.publish("time.A.east", "A")
    nc.publish("time.B.east", "B")
    nc.publish("time.C.west", "C")
    nc.publish("time.D.west", "D")

    # Use the response
    4.times do 
      msg = Fiber.yield
      puts "Msg: #{msg}"
    end
  end.resume
end

# [end subscribe_arrow]
