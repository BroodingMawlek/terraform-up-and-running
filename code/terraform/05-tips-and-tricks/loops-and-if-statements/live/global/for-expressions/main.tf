terraform {
  required_version = ">= 1.0.0, < 2.0.0"
}

variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

# gives each item a name in this case name but could be anything
output "upper_names" {
  value = [for any_description in var.names : upper(any_description)]
}

output "short_upper_names" {
  value = [for v in var.names : upper(v) if length(v) < 5]
}

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default     = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}

output "bios" {
  value = [for key_value_banana, value_name_role in var.hero_thousand_faces : "${key_value_banana} is the ${value_name_role}"]
}

output "upper_roles" {
  value = {for k, v in var.hero_thousand_faces : upper(k) => upper(v)}
}

