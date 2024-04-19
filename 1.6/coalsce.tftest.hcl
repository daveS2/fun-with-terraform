run "coalsce" {
  assert {
    condition     = output.coalsce-list == ["picklerick", "rick"]
    error_message = "If given a list coalsce will return the whole list if first"
  }

  assert {
    condition     = output.coalsce-string-and-string == "birdperson"
    error_message = "Straight forward string example will return the first value "
  }
}