run "coalsce" {
  assert {
    condition     = output.coalsce-list == ["picklerick", "rick"]
    error_message = "If given a list coalsce will return the whole list if first"
  }

  assert {
    condition     = output.coalsce-string-and-string == "birdperson"
    error_message = "Straight forward string example will return the first value "
  }

  assert {
    condition     = output.colasce-empty-list == []
    error_message = "Coalsce can work with an empty list git and will return the empty list"
  }

  assert {
    condition     = output.null-coal-list == []
    error_message = "Coalsce will fail if an object is null, you can convert nulls with a conditonal"
  }

  assert {
    condition     = output.null-coal-string == ""
    error_message = "Coalsce will fail if an object is null, you can convert nulls with a conditonal"
  }
}
