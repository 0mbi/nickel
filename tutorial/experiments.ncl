let 
    default_admin_user = "admin",
    default_admin_pass = "admin"
in 
let RabbitMQConfig = {
   name | String,
   dev-version | Bool,
   exposed-ports | Array Number, 
   admin-user | String | default = default_admin_user,
   admin-pass | String | default = default_admin_pass
} in
{
    name = "rabbit",
    dev-version = true,
    exposed-ports = [5672, 15672],
} | RabbitMQConfig

