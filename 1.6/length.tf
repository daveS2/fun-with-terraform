locals {
  list            = ["picklerick", "rick"]
  emptylist       = []
  emptynull       = null
  emptyobjectlist = [{}]
  emptymap        = {}
}


output "list" {
  value = length(local.list)
}

output "emptylist" {
  value = length(local.emptylist)
}

output "null" {
  value = local.emptynull == null ? 0 : length(local.emptynull)
}

output "emptyobjectlist" {
  value = length(local.emptyobjectlist)
}

output "emptymap" {
  value = length(local.emptymap)
}