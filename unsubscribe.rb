# [begin unsubscribe]
require 'nats/client'
require 'fiber'

NATS.start(servers:["nats://127.0.0.1:4222"]) do |nc|
  Fiber.new do
    f = Fiber.current

    sid = nc.subscribe("time") do |msg, reply|
      f.resume Time.now
    end

    nc.publish("time", 'What is the time?', NATS.create_inbox)

    # Use the response
    msg = Fiber.yield
    puts "Reply: #{msg}"

    nc.unsubscribe(sid)

    # Won't be received
    nc.publish("time", 'What is the time?', NATS.create_inbox)

  end.resume
end

# [end unsubscribe]
