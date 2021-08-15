variable "group_id" {}
variable "guest" { type = set(string) }
variable "reporter" { type = set(string) }
variable "developer" { type = set(string) }
variable "maintainer" { type = set(string) }
variable "owner" { type = set(string) }