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
This shows how the loop can access objects in a map, and how the result of the conditional is returned
*/
  loop_to_show_how_the_result_is_returned_one_conditional = [for item in var.loops_map_of_objects : item.name != "" ? true : false]
  /*
Shows a loop running against the variable loops_map_of_objects which then outputs based on two conditionals.
This shows how the loop can access objects in a map, and how the result of the conditionals is returned
The thought here is that if one passed the conditional we can look at the next item in the map object
*/
  loop_to_show_how_the_result_is_returned_two_conditionals = [for item in var.loops_map_of_objects : item.name != "" ? item.env != "" ? true : false : false]
}

output "loops_how_the_result_is_returned_from_a_for_loop_one_conditional" {
  value = local.loop_to_show_how_the_result_is_returned_one_conditional
}
output "loops_how_the_result_is_returned_from_a_for_loop_two_conditionals" {
  value = local.loop_to_show_how_the_result_is_returned_two_conditionals
}