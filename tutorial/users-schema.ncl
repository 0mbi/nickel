{
  UserSchema = {
    name
      | String,
    ssh-keys
      | Array String
      | optional,
    is-admin
      | Bool
      | default
      = false,
    extra-groups
      | Array String
      | optional,
  },
}
