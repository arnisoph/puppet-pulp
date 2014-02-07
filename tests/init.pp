class{'pulp': repo_enabled => true } ->
class{'pulp::server': } ->
class{'pulp::admin': } ->
class{'pulp::client': }
