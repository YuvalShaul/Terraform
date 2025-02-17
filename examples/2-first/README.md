# Exercise #1: Your First Terraform Project

### Files

Look at this directory and you'll see a couple of `.tf` files.

```
ls -la
```

- **main.tf**  
Generally the name of the major configuration file in a Terraform working directory (but name is arbitrary).
- **variables.tf**  
A file that is dedicated to variable definitions.  

This directory is a  simple example of a terraform project or module.

#### New SSH Key Pair
- Create a new local SSH keyone (choose your file name):
```
cd .ssh
ssh-keygen -t rsa -b 2048 -f YuvKeyPair
chmod 400 MyKeyPair.pem
```
- edit your main file and use the public key (\<your-key-name\>.pub)


### Commands

Let's run some terraform commands!

`terraform init`
* generally the first command you run after writing your config files
* initializes the working directory to prepare terraform to run plans and applies

`terraform fmt`
* simple syntax corrector that analyzes HCL in a given directory (including sub-directories) and corrects small syntactical issues

`terraform validate`
* runs a deeper scan of config to show potential issues with more complex problems such as circular dependencies and missing values

If "terraform init" is successful, you're ready to move on. 
**For now, don't run apply. We'll get to this in a future exercise.**
