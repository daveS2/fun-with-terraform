locals {
  list            = ["picklerick", "rick"]
  emptylist       = []
  emptynull       = null
  emptyobjectlist = [{}]
  emptymap        = {}
}


output "list" {
  value       = length(local.list)
  description = "list"
}

output "emptylist" {
  value       = length(local.emptylist)
  description = "emptylist"
}

output "null" {
  value       = local.emptynull == null ? 0 : length(local.emptynull)
  description = "null"
}

output "emptyobjectlist" {
  value       = length(local.emptyobjectlist)
  description = "emptyobjectlist"
}

output "emptymap" {
  value       = length(local.emptymap)
  description = "emptymap"
}