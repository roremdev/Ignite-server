output "server" {
  description = "AWS Server description"
  value       = {
    security   = module.security.server
    network    = module.network.server
    repository = module.repository.server
    cluster    = {
      name = module.service.cluster
      task = module.service.task
    }
  }
}
