# Using the Terraform Console

- Look at the **play-data.tf** file in this lab.  
It contains some basic definitions that the console is going to use.  

- cd into this directory
- Run the console :  
**terraform console**  

Try the Following expressions:  

## Operators

- **3 + 5**
- **4 * 9**
- **-6**
- **1 + 2 * 3**
- **15 / 2**
- **23 % 5**
- **(3 + 4) == 7**
- **(3 + 4) == 8**
- **5 > 3**
- **! (5 > 3)**
- **(5 > 3) && (6 < 3)**
- **(5 > 3) || (6 < 3)**

## Strings

- **"hello"**
- You cannot try [terraform heredoc](https://www.terraform.io/language/expressions/strings#heredoc-strings) directly, but you can read them:  
**var.my-heredoc**
[Interpolation](https://www.terraform.io/language/expressions/strings#interpolation):  
- **"This is my number: ${var.somenum}"**
- **"Incrementing it by 2: ${var.somenum + 2}"**
[Directives](https://www.terraform.io/language/expressions/strings#directives):  
- **"Hello, %{ if var.my_name != "" }${var.my_name}%{ else }unnamed%{ endif }!"**
- **"Hello, %{ if var.your_name != "" }${var.your_name}%{ else }unnamed%{ endif }!"**
- **"%{for person in ["Dave", "Jane", "Mike"]}  name:${person}  %{endfor}"**



## Converting between types

- **var.stringnum**
- **var.stringnum + 1**

## Accessing maps  

- **var.complex**
- **var.complex.phones**
- **var.complex.phones.home**
- **var.complex["phones"]**
- **var.complex["phones"]["home"]**

## Try some functions

- File system:  
**" ====  ${file("./f1.txt")}  ===="**
- Time:  
timestamp()
- Hash and Crypto:  
sha256("hello world")
- String:  
upper("Hello World")

Try some other functions.