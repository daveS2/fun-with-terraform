

variable "map-001" {
  type        = map(number)
  description = "I am a map with one key value pair. The value is a number."
  default = {
    iam-a-key-001 = 69
  }
}

variable "map-002" {
  type        = map(string)
  description = "I am a map with one key value pair. The value is a string. The key is duplicated with map-003"
  default = {
    iam-a-key-002 = "jake"
  }
}

variable "map-003" {
  type        = map(string)
  description = "I am a map with one key value pair. The value is a string. The key is duplicated with map-002"
  default = {
    iam-a-key-002 = "milo"
  }
}