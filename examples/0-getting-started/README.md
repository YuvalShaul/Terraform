

#### Installing aws cli on Ubuntu
- (based on [this link](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html))
Use this to install aws cli (version 2):
```
snap install aws-cli  --classic
```
- After installation, you should configure the aws cli command:
```
aes configure
```
- You'll have to enter 2 credentials:
  - ACCESS KEY
  - SECRET ACCESS KEY
  Both of these are coming from the console user configuration (part of AMI service)

  
 #### Now install terraform cli
 - Get your instructions from [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 - It has several steps there (adding the reposutory, update, install)
 - Verify that everything was installed:
 ```
 terraform --version
 ```
 