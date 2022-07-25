terraform {
  required_version = ">= 1.0.0, < 2.0.0"
}

variable "names" {
  description = "Names to render"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}
# allows you to insert for in lists of text
output "for_directive" {
  value = "hello I've put some txt in here %{ for name in var.names }${name}, %{ endfor }"
}

# as above but with an index before the name
output "for_directive_index" {
  value = "hello I've put some txt in her %{ for i, name in var.names }(${i}) ${name}, %{ endfor }"
}

output "for_directive_index_if" {
  value = <<EOF
%{ for i, name in var.names }
  ${name}%{ if i < length(var.names) - 1 }, %{ endif }
%{ endfor }
EOF
}

output "for_directive_index_if_strip" {
  value = <<EOF
%{~ for i, name in var.names ~}
${name}%{ if i < length(var.names) - 1 }, %{ endif }
%{~ endfor ~}
EOF
}

output "for_directive_index_if_else_strip" {
  value = <<EOF
%{~ for i, name in var.names ~}
${name}%{ if i < length(var.names) - 1 }, %{ else }.%{ endif }
%{~ endfor ~}
EOF
}
