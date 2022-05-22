variable "bucket_name" {
  type = string
}

variable "bucket_name_source" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "name" {
  type = string
}

variable "source_name" {
  type = string
}

variable "source_category" {
  type = string
}

variable "source_owner" {
  type = string
}

variable "source_provider" {
  type = string
}

variable "source_version" {
  type = string
  default = "1"
}

variable "stage_two_name" {
  type = string
}

variable "stage_two_category" {
  type = string
}

variable "stage_two_owner" {
  type = string
}

variable "stage_two_provider" {
  type = string
}

variable "stage_two_version" {
  type = string
  default = "1"
}

variable "stage_name" {
  type = string
  default = "1"
}