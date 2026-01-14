locals {
  flatten_list_with_objects                    = [{}]
  flatten_list_with_null                       = [null]
  flatten_list_with_objects_and_null           = [null, {}]
  flatten_list_with_list_objects_and_list_null = [[[]], [{}]]
}

output "flatten_list_with_objects" {
  value = flatten(local.flatten_list_with_objects)
}

output "flatten_list_with_null" {
  value = flatten(local.flatten_list_with_null)
}

output "flatten_list_with_objects_and_null" {
  value = flatten(local.flatten_list_with_objects_and_null)
}

output "flatten_list_with_list_objects_and_list_null" {
  value = flatten(local.flatten_list_with_list_objects_and_list_null)
}