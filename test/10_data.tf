data "template_file" "user-data-cloud-init" {
  template = file("./azure-user-data.sh")
}