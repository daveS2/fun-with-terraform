run "for_expressions" {
  assert {
    condition = output.for_expressions == [
      {
        "env"  = "foo-dev"
        "name" = "foo"
      },
      {
        "env"  = "bar-dev"
        "name" = ""
      },
      {
        "env"  = ""
        "name" = "rar"
      },
    ]
    error_message = "A list of objects"
  }

  assert {
    condition = output.for_expressions_filtering_conditional == [
      "foo is false",
      " is true",
      "rar is false",
    ]
    error_message = "item1 should be false, item2 should be true and item3 should be false"
  }

  assert {
    condition = output.for_expressions_filtering_or_conditional == [
      "foo,foo-dev is false",
      ",bar-dev is true",
      "rar, is true",
    ]
    error_message = "item1 should be false, item2 should be true, item3 should be true"
  }

  assert {
    condition = output.for_expressions_filtering_and_conditional == [
      "foo,foo-dev is false",
      ",bar-dev is false",
      "rar, is false",
    ]
    error_message = "item1 should be false, item2 should be false, item3 should be false"
  }

  assert {
    condition = output.for_expression_map_returned == {
      "item1" = {
        "env"  = "foo-dev"
        "name" = "foo"
      }
      "item2" = {
        "env"  = "bar-dev"
        "name" = ""
      }
      "item3" = {
        "env"  = ""
        "name" = "rar"
      }
    }
    error_message = "A map is returned"
  }

  assert {
    condition     = output.for_expression_map_returned_conditional == {}
    error_message = "Empty object"
  }

  assert {
    condition = output.for_expression_flatten_objects_into_a_list == [
      "foo-foo-dev",
      "-bar-dev",
    "rar-"]
    error_message = "Should a list with each object flatten into strings"
  }

  assert {
    condition = output.for_expression_extreme_grouping == {
      "item1-bacon" = {
        "item_key"           = "item1"
        "shopping_list_item" = "bacon"
      }
      "item1-pork loin" = {
        "item_key"           = "item1"
        "shopping_list_item" = "pork loin"
      }
      "item1-zebra fillet steak" = {
        "item_key"           = "item1"
        "shopping_list_item" = "zebra fillet steak"
      }
    }
    error_message = "flattened object of an object that contained a list in a map"

  }
}
