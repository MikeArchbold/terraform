# terraform

Creating repo for personal project work

Create a backend.hcl file in the root directory
	https://www.terraform.io/docs/backends/config.html

To initialize repo run commands in the backend folder. I prefer using the config file instead of setting my access keys as local variables in bash.
	```terraform init
	sed -i.bak s/\#//g main.tf 
	terraform init -backend=${backend.hcl}
	```
