# https://developer.hashicorp.com/terraform/language/functions/coalesce

locals {
  coalsce-list-2-elements = ["picklerick", "rick"]
  coalsce-list-empty      = []
  coalsce-null            = null

}

/*
If given a list coalsce will return the whole list if first
*/
output "coalsce-list" {
  value = coalesce(local.coalsce-list-2-elements)
}

/*
This will Fail
They must be of same type
output "coalsce-list-and-string" {
    value = coalesce(local.coalsce-list-2-elements,"squanchy")
}
*/

/*
Straight forward string example
*/
output "coalsce-string-and-string" {
  value = coalesce("birdperson", "squanchy")
}

/*
Coalsce can work with an empty list
*/
output "colasce-empty-list" {
  value = coalesce(local.coalsce-list-empty)
}

/*
This will Fail
output "null-coal" {
    value = coalesce(local.coalsce-null)
}
*/

/* 
How to convert a null to support coalse
*/

output "null-coal-list" {
  value = local.coalsce-null == null ? [] : coalesce(local.coalsce-null)
}

output "null-coal-string" {
  value = local.coalsce-null == null ? "" : coalesce(local.coalsce-null)
}