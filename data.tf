data "template_file" "startup" {
  template = file("app/startup.sh")
  vars = {
    address = "some value"
  }
}