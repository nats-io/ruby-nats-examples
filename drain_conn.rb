require 'nats/client'

# [begin drain_conn]
NATS.start(drain_timeout: 1) do |nc|
  NATS.subscribe('foo', queue: "workers") do |msg, reply, sub|
    nc.publish(reply, "ACK:#{msg}")
  end

  NATS.subscribe('bar', queue: "workers") do |msg, reply, sub|
    nc.publish(reply, "ACK:#{msg}")
  end

  NATS.subscribe('quux', queue: "workers") do |msg, reply, sub|
    nc.publish(reply, "ACK:#{msg}")
  end

  EM.add_timer(2) do
    next if NATS.draining?

    # Drain gracefully closes the connection.
    NATS.drain do
      puts "Done draining. Connection is closed."
    end
  end
end
# [end drain_conn]
