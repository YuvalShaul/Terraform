## Setting Up

In this first exercise:
    - Login into our AWS accounts with our credentials
    - Create a Cloud9 server/environment where we'll run Terraform throughout the course.

# Log into the AWS Console

* You should have an AWS account already set up.
* Login into your **IAM user**.
* If you don't have an IAM user, please create one now, and login again using it:
(https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html#id_users_create_console).
* In the top bar, near the right, you'll see your username/alias @ introterraform. Clicking on that will display a dropdown
In the dropdown, click on "My Security Credentials"
* This will take you to your security credentials screen/tab. Feel free to change your password if you like.
* Click "Create access key". An access key and secret access key will be created for you, copy the Access key ID and Secret access key (or download a CSV file), we'll use them in setting your environment up below.
* Close out of the modal/pop-up

# Launch a cloud9 Environment

* In the top bar of the AWS Console, near the left, you'll see "AWS Services", click on it, and in the drop down search box, type "Cloud9" which will filter available services in the search list.
* Click on "Cloud9" which will take you to where we can create your environment.
* Click on "Create Environment"
Give your environment a unique name and, optionally, a description. Click "Next"
* Keep the settings as their defaults on this screen, then click "Next"
* Review your settings on the next screen, and then click "Create"
* Wait for your environment to start. In this step, AWS is provisioning an EC2 instance on which your IDE environment will run. This gives us the distinct advantage of having a consistent and concontrolled environment for development regardless of client hardware and OS. It also allows us to connect to our instances and AWS's API without worrying about port availability in a corporate office. :-)
* Once your IDE loads, you should see a Welcome document. Your instructor will give you a walkthrough of the visible panel. Feel free to take a moment to read through the welcome document.
