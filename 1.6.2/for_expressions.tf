variable "loops_map_of_objects" {
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

locals {
  /*
Shows a loop running against the variable loops_map_of_objects which then outputs based on a conditional.
This shows how the loop can access objects in a map, and how the result of the conditional is returned.
*/
  loop_to_show_how_the_result_is_returned_one_conditional = [for item in var.loops_map_of_objects : item.name == "" ? "${item.name} is true" : "${item.name} is false"]
  /*
Shows a loop running against the variable loops_map_of_objects which then outputs based on an OR.
This shows how the loop can access objects in a map, and how the result of the conditional is returned.
*/
  loop_to_show_how_the_result_is_returned_with_an_or = [for item in var.loops_map_of_objects : item.name == "" || item.env == "" ? "${item.name},${item.env} is true" : "${item.name},${item.env} is false"]
}

output "loops_how_the_result_is_returned_from_a_for_loop_one_conditional" {
  value = local.loop_to_show_how_the_result_is_returned_one_conditional
}
output "loops_how_the_result_is_returned_from_a_for_loop_with_an_or" {
  value = local.loop_to_show_how_the_result_is_returned_with_an_or
}