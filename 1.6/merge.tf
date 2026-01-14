
locals {
  merged-maps-different-types = merge(var.map-001, var.map-002)
  merged-maps-same-key        = merge(var.map-002, var.map-003) # Only one will survive
}

output "merge-maps-with-different-types" {
  value       = local.merged-maps-different-types
  description = "Make all the maps a map."
}

output "merge-maps-with-same-key" {
  value       = local.merged-maps-same-key
  description = "Make all the maps a map."
}