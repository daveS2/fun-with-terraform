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
  }
}

/*
Shows a loop running against the variable loops_map_of_objects which then outputs based on a conditional.
This shows how the loop can access objects in a map, and how the result of the conditional is returned
*/
locals {
  loop_to_show_how_the_result_is_returned = [for item in var.loops_map_of_objects : item.name != "" ? true : false]
}

output "loops_how_the_result_is_returned_from_a_for_loop"{
  value = local.loop_to_show_how_the_result_is_returned
}