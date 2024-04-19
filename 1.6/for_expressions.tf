# https://developer.hashicorp.com/terraform/language/expressions/for

variable "for_expressions_map_of_objects" {
  description = "A map of objects with key value pairs"
  type = map(object({
    name = string
    env  = string
  }))
  default = {
    item1 = {
      name = "foo"
      env  = "foo-dev"
    }
    item2 = {
      name = ""
      env  = "bar-dev"
    }
    item3 = {
      name = "rar"
      env  = ""
    }
  }
}

variable "for_expressions_map_of_objects_with_a_list" {
  description = "A map of objects with a single key value pair where the value is a list"
  type = map(object({
    shopping_list = list(string)
  }))
  default = {
    item1 = {
      shopping_list = ["bacon", "pork loin", "zebra fillet steak"]
    }
  }
}

/*
Shows a loop running against the variable, basically the same thing as inputted except it's a list
For each object in the variable
  Access the key.value within the object and return
*/
output "for_expressions" {
  description = "for_expressions"
  value       = [for item in var.for_expressions_map_of_objects : item]
}

/*
Shows a loop running against the variable loops_map_of_objects which then filters based on a conditional.
For each object in the variable
  Access the key.value within the object
    If the (key=name and the value is "") then true, else false as list of values
*/
output "for_expressions_filtering_conditional" {
  description = "for_expressions_filtering_conditional"
  value       = [for item in var.for_expressions_map_of_objects : item.name == "" ? "${item.name} is true" : "${item.name} is false"]
}

/*
Shows a loop running against the variable loops_map_of_objects which then filters based on an OR.
For each object in the variable
  Access the key.value within the object
  If the (key=name and the value is "") or (key=env and the value is "") then true else false as list of values
*/
output "for_expressions_filtering_or_conditional" {
  description = "for_expressions_filtering_or_conditional"
  value       = [for item in var.for_expressions_map_of_objects : item.name == "" || item.env == "" ? "${item.name},${item.env} is true" : "${item.name},${item.env} is false"]
}

/*
Shows a loop running against the variable loops_map_of_objects which then filters based on an AND.
For each object in the variable
  Access the key.value within the object
  If the (key=name and the value is "") or (key=env and the value is "") then true else false as list of values (Empty in this exampe)
*/
output "for_expressions_filtering_and_conditional" {
  description = "for_expressions_filtering_and_conditional"
  value       = [for item in var.for_expressions_map_of_objects : item.name == "" && item.env == "" ? "${item.name},${item.env} is true" : "${item.name},${item.env} is false"]
}

/*
Shows a for returning an object, basically the same thing as inputted tbh
for {key, value}  in the variable
  return {key, value}
*/
output "for_expression_map_returned" {
  description = "for_expression_map_returned"
  value       = { for key, value in var.for_expressions_map_of_objects : key => value }
}

/*
Shows a for returning an object, with a filtering condition
for {key, value}  in the variable
  if the value = foo-dev then return {key, value}
    else do not return an object
*/
output "for_expression_map_returned_conditional" {
  description = "for_expression_flatten_objects_into_a_list"
  value       = { for key, value in var.for_expressions_map_of_objects : key => value if value == "foo-dev" }
}

/*
Shows flatten objects and returning a list
*/
output "for_expression_flatten_objects_into_a_list" {
  description = "for_expression_flatten_objects_into_a_list"
  value       = [for key, mapd in var.for_expressions_map_of_objects : "${mapd.name}-${mapd.env}"]
}

/*
This could be an really specific example but it is interesting, you are taking a list of
string within an object and grouping them into invdidvdual objects within a map
For key and value in the variable
  Return an object
    for key and value in the list create an object with a new key and new values
  group
*/
output "for_expression_extreme_grouping" {
  description = "for_expression_extreme_grouping"
  value = merge([
    for item-key, item-value in var.for_expressions_map_of_objects_with_a_list :
    {
      for shopping_list_key, shopping_list_item in item-value.shopping_list :
      "${item-key}-${shopping_list_item}" => {
        item_key           = item-key
        shopping_list_item = shopping_list_item
      }
    }
  ]...)
}
