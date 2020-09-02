data "template_file" "startup" {
  template = file("startup.sh")
  vars = {
    address = "some value"
  }
}