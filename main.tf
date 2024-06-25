terraform {
	backend "local" {
		path = "./terraform.tfstate"
	}
}

resource "null_resource" "create_python_welcome_message_file" {
	provisioner "local-exec" {
		command = <<-EOT
			echo '
def welcome_message():
	print("${var.welcome_message}")
	
welcome_message()
	' > welcome_message.py
	EOT
}
}
