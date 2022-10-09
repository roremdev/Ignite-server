# ℹ️ Description
# Defines the input variables that are referenced in main.tf.tf, which make the configuration customizable.

variable "project" {
  description = "AWS project name"
  default     = "ignite"
}