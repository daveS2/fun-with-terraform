locals{
    list-coal=["picklerick","rick"]
    emptylist-coal=[]
    emptynull-coal=null
}

output "list-coal" {
    value = coalesce(local.list-coal)
}

output "emptylist-coal" {
    value = coalesce(local.emptylist-coal)
}

/*
This will Fail
output "null-coal" {
    value = coalesce(local.emptynull-coal)
}
*/

output "null-coal" {
    value = local.emptynull == null ? [] : coalesce(local.emptynull-coal)
}