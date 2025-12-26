let 
    expose-to-localhost = fun ports => std.array.map (fun port => "127.0.0.1:%{port}:%{port}") ports,
    rabbitmq = import "./experiments.ncl"
in
    {
        services = {
            rabbit = {
            image = "rabbitmq:3.13-management",
            container_name = rabbitmq.name,
            ports = expose-to-localhost rabbitmq.exposed-ports,
#            ports = [ "127.0.0.1:5672:5672", "127.0.0.1:15672:15672"],
            environment = {
                 RABBITMQ_DEFAULT_USER= "admin",
                 RABBITMQ_DEFAULT_PASS= 1234
            }
            }
        }
    }
# services:
#  redis:
#    image: redis:alpine
#    ports:
#      - "127.0.0.1:6379:6379"
#
#  rabbitmq:
#    image: rabbitmq:3.13-management   # use the management image to get the web UI
#    container_name: rabbitmq-noodles
#    ports:
#      - "127.0.0.1:5672:5672"   # AMQP protocol
#      - "127.0.0.1:15672:15672" # Management UI
#    environment:
#      RABBITMQ_DEFAULT_USER: admin
#      RABBITMQ_DEFAULT_PASS: 1234
#
#